#!/usr/bin/env bash
# Run from the repo root (the folder that contains helm/). Creates helm/webapp/.
set -euo pipefail
cd "$(dirname "$0")" 2>/dev/null || true
[ -d helm ] || { echo "Run this from the repo root: helm/ folder not found"; exit 1; }
mkdir -p helm/webapp/templates
cat > helm/webapp/Chart.yaml <<'WEBAPP_EOF'
apiVersion: v2
name: webapp
description: Small static web application (nginx) with optional internet exposure and optional Istio Gateway/VirtualService
type: application
version: 0.1.0
appVersion: "1.27"
WEBAPP_EOF
cat > helm/webapp/values.yaml <<'WEBAPP_EOF'
replicaCount: 1

image:
  repository: nginxinc/nginx-unprivileged   # runs as non-root, listens on 8080
  tag: "1.27-alpine"
  pullPolicy: IfNotPresent

# Page served by the app. Replace with your own HTML or mount real content.
content:
  title: "webapp on devops-dev-eks"
  body: "Helm deployment works. Served by nginx."

service:
  # ClusterIP  -> in-cluster only (use this when Istio fronts the app)
  # LoadBalancer -> internet-facing NLB straight to the Service (no Istio needed)
  type: ClusterIP
  port: 80
  annotations: {}

# Optional Istio resources. Leave off until Istio is ready.
istio:
  enabled: false
  hosts: ["*"]              # replace with your DNS name when you have one
  gatewaySelector:
    istio: ingress          # label on the pods of the istio/gateway release
  httpPort: 80

resources:
  requests:
    cpu: 25m
    memory: 32Mi
  limits:
    memory: 64Mi

podAnnotations: {}
nodeSelector: {}
tolerations: []
affinity: {}
WEBAPP_EOF
cat > helm/webapp/values-internet.yaml <<'WEBAPP_EOF'
# Phase 1: internet-facing NLB straight to the Service (no Istio)
service:
  type: LoadBalancer
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
    service.beta.kubernetes.io/aws-load-balancer-scheme: internet-facing
WEBAPP_EOF
cat > helm/webapp/values-istio.yaml <<'WEBAPP_EOF'
# Phase 2: Service stays internal, Istio ingress gateway fronts it
service:
  type: ClusterIP
istio:
  enabled: true
WEBAPP_EOF
cat > helm/webapp/templates/_helpers.tpl <<'WEBAPP_EOF'
{{- define "webapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webapp.fullname" -}}
{{- if contains .Chart.Name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "webapp.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/name: {{ include "webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
WEBAPP_EOF
cat > helm/webapp/templates/configmap.yaml <<'WEBAPP_EOF'
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "webapp.fullname" . }}-html
  labels:
    {{- include "webapp.labels" . | nindent 4 }}
data:
  index.html: |
    <!doctype html>
    <html lang="en">
      <head><meta charset="utf-8"><title>{{ .Values.content.title }}</title></head>
      <body>
        <h1>{{ .Values.content.title }}</h1>
        <p>{{ .Values.content.body }}</p>
      </body>
    </html>
WEBAPP_EOF
cat > helm/webapp/templates/deployment.yaml <<'WEBAPP_EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "webapp.fullname" . }}
  labels:
    {{- include "webapp.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "webapp.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      annotations:
        checksum/html: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
        {{- with .Values.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      labels:
        {{- include "webapp.selectorLabels" . | nindent 8 }}
        # Istio-friendly labels (used for telemetry/routing later)
        app: {{ include "webapp.name" . }}
        version: {{ .Chart.AppVersion | quote }}
    spec:
      automountServiceAccountToken: false
      securityContext:
        runAsNonRoot: true
        seccompProfile:
          type: RuntimeDefault
      containers:
        - name: web
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http          # "http" prefix/name lets Istio detect the protocol
              containerPort: 8080
          readinessProbe:
            httpGet: { path: /, port: http }
            initialDelaySeconds: 2
            periodSeconds: 5
          livenessProbe:
            httpGet: { path: /, port: http }
            initialDelaySeconds: 10
            periodSeconds: 10
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
            capabilities:
              drop: ["ALL"]
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          volumeMounts:
            - name: html
              mountPath: /usr/share/nginx/html/index.html
              subPath: index.html
            - name: tmp
              mountPath: /tmp
      volumes:
        - name: html
          configMap:
            name: {{ include "webapp.fullname" . }}-html
        - name: tmp
          emptyDir: {}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
WEBAPP_EOF
cat > helm/webapp/templates/service.yaml <<'WEBAPP_EOF'
apiVersion: v1
kind: Service
metadata:
  name: {{ include "webapp.fullname" . }}
  labels:
    {{- include "webapp.labels" . | nindent 4 }}
    app: {{ include "webapp.name" . }}
  {{- with .Values.service.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ .Values.service.type }}
  selector:
    {{- include "webapp.selectorLabels" . | nindent 4 }}
  ports:
    - name: http
      port: {{ .Values.service.port }}
      targetPort: http
WEBAPP_EOF
cat > helm/webapp/templates/istio.yaml <<'WEBAPP_EOF'
{{- if .Values.istio.enabled }}
apiVersion: networking.istio.io/v1
kind: Gateway
metadata:
  name: {{ include "webapp.fullname" . }}
  labels:
    {{- include "webapp.labels" . | nindent 4 }}
spec:
  selector:
    {{- toYaml .Values.istio.gatewaySelector | nindent 4 }}
  servers:
    - port:
        number: {{ .Values.istio.httpPort }}
        name: http
        protocol: HTTP
      hosts:
        {{- toYaml .Values.istio.hosts | nindent 8 }}
---
apiVersion: networking.istio.io/v1
kind: VirtualService
metadata:
  name: {{ include "webapp.fullname" . }}
  labels:
    {{- include "webapp.labels" . | nindent 4 }}
spec:
  hosts:
    {{- toYaml .Values.istio.hosts | nindent 4 }}
  gateways:
    - {{ .Release.Namespace }}/{{ include "webapp.fullname" . }}
  http:
    - route:
        - destination:
            host: {{ include "webapp.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local
            port:
              number: {{ .Values.service.port }}
{{- end }}
WEBAPP_EOF
echo "Created:"; find helm/webapp -type f | sort