# Graph Report - devops  (2026-11-02)

## Corpus Check
- 87 files · ~33,277 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 32 file(s) not represented in the graph (top: .tpl 23, (none) 7, .tgz 1)

## Summary
- 1394 nodes · 1425 edges · 103 communities (90 shown, 13 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `2310e17b`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- helm.yml
- env
- istio.yml
- steps
- Bitnami package for Grafana
- steps
- env
- steps
- service
- grafana
- with
- Parameters
- env
- with
- with
- eks-scale.yml
- canary-helm-publish.yml
- unlock
- webapp/values.yaml
- containerSecurityContext
- inputs
- containers
- grafana/Chart.yaml
- ldap
- canary-demo/values.yaml
- common/Chart.yaml
- pilot
- grafana/values.yaml
- values-original.yaml
- ingress
- codebuild-test.yml
- httpRoute
- image
- gp3-storageclass.yaml
- resources
- v1
- smtp
- livenessProbe
- ingress
- global
- networkPolicy
- readinessProbe
- startupProbe
- peer-authentication.yaml
- selector
- persistence
- canary-rendered.yaml
- labels
- ports
- canary-demo/Chart.yaml
- test-release/Chart.yaml
- webapp/Chart.yaml
- livenessProbe
- resources
- podSecurityContext
- httpGet
- Helm
- service
- podSecurityContext
- Istio on EKS
- Pod canary-demo-test-connection
- ServiceAccount canary-demo
- securityContext
- serviceAccount
- autoscaling
- serviceAccount
- istio
- admin
- serviceAccount
- module.eks
- module.vpc
- securityContext
- image
- service
- image
- config
- diagnosticMode
- nodeAffinityPreset
- pdb
- imageRenderer
- service
- dashboardsProvider
- datasources
- eks/README.md
- test-release/values.yaml
- common/values.yaml
- containerPorts
- updateStrategy
- README.md
- vpc/README.md
- steps
- terrformunlock.yml
- eks/.terraform.lock.hcl
- environment
- layer
- method
- lock_id
- provider.registry.terraform.io/hashicorp/aws

## God Nodes (most connected - your core abstractions)
1. `grafana` - 46 edges
2. `module.eks` - 16 edges
3. `Parameters` - 16 edges
4. `ingress` - 15 edges
5. `ldap` - 14 edges
6. `module.vpc` - 14 edges
7. `containers` - 13 edges
8. `service` - 13 edges
9. `Bitnami package for Grafana` - 13 edges
10. `labels` - 12 edges

## Surprising Connections (you probably didn't know these)
- `data.terraform_remote_state.vpc` --references--> `var.state_bucket`  [EXTRACTED]
  eks/data.tf → eks/variables.tf
- `data.terraform_remote_state.vpc` --references--> `var.state_bucket_region`  [EXTRACTED]
  eks/data.tf → eks/variables.tf
- `local.tags` --references--> `var.tags`  [EXTRACTED]
  eks/main.tf → eks/variables.tf
- `module.eks` --references--> `var.api_allowed_cidrs`  [EXTRACTED]
  eks/main.tf → eks/variables.tf
- `module.eks` --references--> `var.kubernetes_version`  [EXTRACTED]
  eks/main.tf → eks/variables.tf

## Import Cycles
- None detected.

## Communities (103 total, 13 thin omitted)

### Community 0 - "helm.yml"
Cohesion: 0.04
Nodes (48): default, description, options, type, default, description, options, type (+40 more)

### Community 1 - "env"
Cohesion: 0.04
Nodes (47): default, description, required, type, concurrency, cancel-in-progress, group, env (+39 more)

### Community 2 - "istio.yml"
Cohesion: 0.04
Nodes (47): default, description, options, type, concurrency, cancel-in-progress, group, env (+39 more)

### Community 3 - "steps"
Cohesion: 0.04
Nodes (47): concurrency, cancel-in-progress, group, default, description, name, required, runs-on (+39 more)

### Community 4 - "Bitnami package for Grafana"
Cohesion: 0.04
Nodes (47): Backup and restore, Bitnami package for Grafana, Common parameters, Configuration and installation details, Considerations when upgrading to this version, Diagnostic Mode Parameters, Differences between the Bitnami Grafana chart and the Bitnami Grafana Operator chart, Global parameters (+39 more)

### Community 5 - "steps"
Cohesion: 0.04
Nodes (46): default, description, required, type, concurrency, cancel-in-progress, group, env (+38 more)

### Community 6 - "env"
Cohesion: 0.04
Nodes (44): default, description, options, required, type, concurrency, cancel-in-progress, group (+36 more)

### Community 7 - "steps"
Cohesion: 0.05
Nodes (42): default, description, options, type, concurrency, cancel-in-progress, group, run (+34 more)

### Community 8 - "service"
Cohesion: 0.05
Nodes (37): prometheus.io/path, prometheus.io/port, prometheus.io/scrape, metrics, enabled, prometheusRule, service, serviceMonitor (+29 more)

### Community 9 - "grafana"
Cohesion: 0.05
Nodes (37): grafana, affinity, args, automountServiceAccountToken, command, customLivenessProbe, customReadinessProbe, customStartupProbe (+29 more)

### Community 10 - "with"
Cohesion: 0.06
Nodes (35): name, runs-on, steps, timeout-minutes, concurrency, cancel-in-progress, group, env (+27 more)

### Community 11 - "Parameters"
Cohesion: 0.06
Nodes (34): Affinities, Bitnami Common Library Chart, Capabilities, Compatibility, Considerations when upgrading to this version, Errors, Example of use, ExistingSecret (+26 more)

### Community 12 - "env"
Cohesion: 0.06
Nodes (31): concurrency, cancel-in-progress, group, name, runs-on, steps, timeout-minutes, env (+23 more)

### Community 13 - "with"
Cohesion: 0.07
Nodes (30): JFROG_TOKEN, JFROG_USERNAME, jobs, list-artifacts, name, permissions, runs-on, steps (+22 more)

### Community 14 - "with"
Cohesion: 0.07
Nodes (30): JFROG_TOKEN, JFROG_USERNAME, jobs, vault-test, name, on, push, permissions (+22 more)

### Community 15 - "eks-scale.yml"
Cohesion: 0.06
Nodes (30): concurrency, cancel-in-progress, group, env, CLUSTER, NODES, nodes, jobs (+22 more)

### Community 16 - "canary-helm-publish.yml"
Cohesion: 0.07
Nodes (28): concurrency, cancel-in-progress, group, env, CHART_NAME, CHART_PATH, HELM_VERSION, JFROG_ACCESS_TOKEN (+20 more)

### Community 17 - "unlock"
Cohesion: 0.20
Nodes (10): run, ENVIRONMENT, LOCK_ID, unlock, working-directory, defaults, env, if (+2 more)

### Community 18 - "webapp/values.yaml"
Cohesion: 0.07
Nodes (28): affinity, content, body, title, istio, image, pullPolicy, repository (+20 more)

### Community 19 - "containerSecurityContext"
Cohesion: 0.10
Nodes (26): drop, allowPrivilegeEscalation, capabilities, enabled, privileged, readOnlyRootFilesystem, runAsGroup, runAsNonRoot (+18 more)

### Community 20 - "inputs"
Cohesion: 0.29
Nodes (7): description, required, type, confirm, on, workflow_dispatch, inputs

### Community 21 - "containers"
Cohesion: 0.17
Nodes (12): args, command, env, image, imagePullPolicy, livenessProbe, name, ports (+4 more)

### Community 22 - "grafana/Chart.yaml"
Cohesion: 0.09
Nodes (22): annotations, category, images, licenses, tanzuCategory, apiVersion, appVersion, dependencies (+14 more)

### Community 23 - "ldap"
Cohesion: 0.09
Nodes (22): ldap, allowSignUp, basedn, binddn, bindpw, configMapName, configuration, enabled (+14 more)

### Community 24 - "canary-demo/values.yaml"
Cohesion: 0.11
Nodes (17): affinity, autoscaling, enabled, fullnameOverride, httpRoute, enabled, imagePullSecrets, name (+9 more)

### Community 25 - "common/Chart.yaml"
Cohesion: 0.12
Nodes (16): annotations, category, licenses, apiVersion, appVersion, description, home, icon (+8 more)

### Community 26 - "pilot"
Cohesion: 0.13
Nodes (16): holdApplicationUntilProxyStarts, global, proxy, memory, meshConfig, accessLogFile, defaultConfig, pilot (+8 more)

### Community 27 - "grafana/values.yaml"
Cohesion: 0.12
Nodes (15): alerting, configMapName, clusterDomain, commonAnnotations, commonLabels, dashboardsConfigMaps, extraDeploy, fullnameOverride (+7 more)

### Community 28 - "values-original.yaml"
Cohesion: 0.13
Nodes (14): affinity, fullnameOverride, imagePullSecrets, nameOverride, nodeSelector, podAnnotations, podLabels, podSecurityContext (+6 more)

### Community 29 - "ingress"
Cohesion: 0.13
Nodes (15): ingress, annotations, apiVersion, enabled, extraHosts, extraPaths, extraRules, extraTls (+7 more)

### Community 30 - "codebuild-test.yml"
Cohesion: 0.15
Nodes (12): jobs, test-runner, name, on, workflow_dispatch, permissions, contents, name (+4 more)

### Community 31 - "httpRoute"
Cohesion: 0.17
Nodes (12): httpRoute, annotations, enabled, hostnames, parentRefs, rules, path, name (+4 more)

### Community 32 - "image"
Cohesion: 0.17
Nodes (11): global, security, image, digest, pullSecrets, registry, repository, tag (+3 more)

### Community 33 - "gp3-storageclass.yaml"
Cohesion: 0.17
Nodes (11): allowVolumeExpansion, apiVersion, kind, metadata, name, parameters, encrypted, type (+3 more)

### Community 34 - "resources"
Cohesion: 0.17
Nodes (11): service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled, service.beta.kubernetes.io/aws-load-balancer-type, memory, cpu, memory, resources, limits, requests (+3 more)

### Community 35 - "v1"
Cohesion: 0.18
Nodes (11): appVersion, enabled, replicaCount, tag, appVersion, enabled, replicaCount, tag (+3 more)

### Community 36 - "smtp"
Cohesion: 0.18
Nodes (11): smtp, enabled, existingSecret, existingSecretPasswordKey, existingSecretUserKey, fromAddress, fromName, host (+3 more)

### Community 37 - "livenessProbe"
Cohesion: 0.22
Nodes (10): path, port, livenessProbe, httpGet, initialDelaySeconds, periodSeconds, readinessProbe, httpGet (+2 more)

### Community 38 - "ingress"
Cohesion: 0.20
Nodes (10): host, paths, ingress, annotations, className, enabled, hosts, tls (+2 more)

### Community 39 - "global"
Cohesion: 0.20
Nodes (10): openshift, global, compatibility, defaultStorageClass, imagePullSecrets, imageRegistry, security, storageClass (+2 more)

### Community 40 - "networkPolicy"
Cohesion: 0.20
Nodes (10): networkPolicy, addExternalClientAccess, allowExternal, allowExternalEgress, enabled, extraEgress, extraIngress, ingressNSMatchLabels (+2 more)

### Community 41 - "readinessProbe"
Cohesion: 0.22
Nodes (9): readinessProbe, enabled, failureThreshold, initialDelaySeconds, path, periodSeconds, scheme, successThreshold (+1 more)

### Community 42 - "startupProbe"
Cohesion: 0.22
Nodes (9): startupProbe, enabled, failureThreshold, initialDelaySeconds, path, periodSeconds, scheme, successThreshold (+1 more)

### Community 43 - "peer-authentication.yaml"
Cohesion: 0.22
Nodes (8): apiVersion, kind, metadata, name, namespace, mode, spec, mtls

### Community 44 - "selector"
Cohesion: 0.20
Nodes (12): spec, spec, app.kubernetes.io/instance, app.kubernetes.io/name, version, app.kubernetes.io/instance, app.kubernetes.io/name, matchLabels (+4 more)

### Community 45 - "persistence"
Cohesion: 0.25
Nodes (8): persistence, accessMode, annotations, enabled, existingClaim, persistence, size, storageClass

### Community 46 - "canary-rendered.yaml"
Cohesion: 0.16
Nodes (13): apiVersion, kind, metadata, apiVersion, kind, metadata, Service canary-demo, Deployment canary-demo-v1 (+5 more)

### Community 47 - "labels"
Cohesion: 0.29
Nodes (7): app.kubernetes.io/instance, app.kubernetes.io/managed-by, app.kubernetes.io/name, app.kubernetes.io/version, helm.sh/chart, version, labels

### Community 48 - "ports"
Cohesion: 0.29
Nodes (7): name, port, protocol, targetPort, spec, ports, type

### Community 49 - "canary-demo/Chart.yaml"
Cohesion: 0.29
Nodes (6): apiVersion, appVersion, description, name, type, version

### Community 50 - "test-release/Chart.yaml"
Cohesion: 0.29
Nodes (6): apiVersion, appVersion, description, name, type, version

### Community 51 - "webapp/Chart.yaml"
Cohesion: 0.29
Nodes (6): apiVersion, appVersion, description, name, type, version

### Community 52 - "livenessProbe"
Cohesion: 0.29
Nodes (7): livenessProbe, enabled, failureThreshold, initialDelaySeconds, periodSeconds, successThreshold, timeoutSeconds

### Community 53 - "resources"
Cohesion: 0.33
Nodes (6): memory, cpu, memory, resources, limits, requests

### Community 54 - "podSecurityContext"
Cohesion: 0.33
Nodes (6): podSecurityContext, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, type

### Community 55 - "httpGet"
Cohesion: 0.40
Nodes (6): path, port, livenessProbe, httpGet, readinessProbe, httpGet

### Community 56 - "Helm"
Cohesion: 0.33
Nodes (5): Helm, Helm version, Layout, Repositories, Running the workflow

### Community 57 - "service"
Cohesion: 0.33
Nodes (5): service.beta.kubernetes.io/aws-load-balancer-scheme, service.beta.kubernetes.io/aws-load-balancer-type, service, annotations, type

### Community 58 - "podSecurityContext"
Cohesion: 0.33
Nodes (6): podSecurityContext, enabled, fsGroup, fsGroupChangePolicy, supplementalGroups, sysctls

### Community 59 - "Istio on EKS"
Cohesion: 0.33
Nodes (5): Deploying, Istio on EKS, Layout, Notes, What gets installed

### Community 60 - "Pod canary-demo-test-connection"
Cohesion: 0.25
Nodes (8): helm.sh/hook, Pod canary-demo-test-connection, annotations, apiVersion, kind, metadata, spec, restartPolicy

### Community 61 - "ServiceAccount canary-demo"
Cohesion: 0.40
Nodes (5): ServiceAccount canary-demo, apiVersion, automountServiceAccountToken, kind, metadata

### Community 62 - "securityContext"
Cohesion: 0.40
Nodes (5): drop, securityContext, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem

### Community 63 - "serviceAccount"
Cohesion: 0.40
Nodes (5): serviceAccount, annotations, automount, create, name

### Community 64 - "autoscaling"
Cohesion: 0.40
Nodes (5): autoscaling, enabled, maxReplicas, minReplicas, targetCPUUtilizationPercentage

### Community 65 - "serviceAccount"
Cohesion: 0.40
Nodes (5): serviceAccount, annotations, automount, create, name

### Community 66 - "istio"
Cohesion: 0.40
Nodes (4): istio, enabled, service, type

### Community 67 - "admin"
Cohesion: 0.40
Nodes (5): admin, existingSecret, existingSecretPasswordKey, password, user

### Community 68 - "serviceAccount"
Cohesion: 0.40
Nodes (5): serviceAccount, annotations, automountServiceAccountToken, create, name

### Community 69 - "module.eks"
Cohesion: 0.11
Nodes (26): data.terraform_remote_state.vpc, Terraform module: eks, local.admin_access_entries, local.name, local.private_subnets, local.tags, local.vpc_id, module.eks (+18 more)

### Community 70 - "module.vpc"
Cohesion: 0.13
Nodes (22): data.aws_availability_zones.available, Terraform module: vpc, local.azs, local.name, local.tags, module.vpc, output.azs, output.natgw_ids (+14 more)

### Community 71 - "securityContext"
Cohesion: 0.20
Nodes (10): name, type, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, imagePullSecrets, securityContext (+2 more)

### Community 72 - "image"
Cohesion: 0.50
Nodes (4): image, pullPolicy, registry, repository

### Community 73 - "service"
Cohesion: 0.50
Nodes (4): service, port, targetPort, type

### Community 74 - "image"
Cohesion: 0.50
Nodes (4): image, pullPolicy, repository, tag

### Community 75 - "config"
Cohesion: 0.50
Nodes (4): config, grafanaIniConfigMap, grafanaIniSecret, useGrafanaIniFile

### Community 76 - "diagnosticMode"
Cohesion: 0.50
Nodes (4): diagnosticMode, args, command, enabled

### Community 77 - "nodeAffinityPreset"
Cohesion: 0.50
Nodes (4): nodeAffinityPreset, key, type, values

### Community 78 - "pdb"
Cohesion: 0.50
Nodes (4): pdb, create, maxUnavailable, minAvailable

### Community 79 - "imageRenderer"
Cohesion: 0.50
Nodes (4): imageRenderer, callbackURL, enabled, serverURL

### Community 80 - "service"
Cohesion: 0.67
Nodes (3): service, port, type

### Community 81 - "dashboardsProvider"
Cohesion: 0.67
Nodes (3): dashboardsProvider, configMapName, enabled

### Community 82 - "datasources"
Cohesion: 0.67
Nodes (3): datasources, secretDefinition, secretName

### Community 91 - "steps"
Cohesion: 0.20
Nodes (10): id, if, name, run, uses, with, steps, aws-access-key-id (+2 more)

### Community 92 - "terrformunlock.yml"
Cohesion: 0.25
Nodes (7): concurrency, cancel-in-progress, group, jobs, name, permissions, contents

### Community 93 - "eks/.terraform.lock.hcl"
Cohesion: 0.33
Nodes (5): provider.registry.terraform.io/hashicorp/aws, provider.registry.terraform.io/hashicorp/cloudinit, provider.registry.terraform.io/hashicorp/null, provider.registry.terraform.io/hashicorp/time, provider.registry.terraform.io/hashicorp/tls

### Community 94 - "environment"
Cohesion: 0.40
Nodes (5): default, description, options, type, environment

### Community 95 - "layer"
Cohesion: 0.40
Nodes (5): layer, default, description, options, type

### Community 96 - "method"
Cohesion: 0.40
Nodes (5): method, default, description, options, type

### Community 97 - "lock_id"
Cohesion: 0.50
Nodes (4): lock_id, description, required, type

## Knowledge Gaps
- **13 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `grafana` connect `grafana` to `readinessProbe`, `startupProbe`, `nodeAffinityPreset`, `pdb`, `containerSecurityContext`, `livenessProbe`, `containerPorts`, `updateStrategy`, `podSecurityContext`, `grafana/values.yaml`?**
  _High betweenness centrality (0.013) - this node is a cross-community bridge._
- **Should `helm.yml` be split into smaller, more focused modules?**
  _Cohesion score 0.04081632653061224 - nodes in this community are weakly interconnected._
- **Why does `metrics` connect `service` to `grafana/values.yaml`?**
  _High betweenness centrality (0.005) - this node is a cross-community bridge._
- **Should `env` be split into smaller, more focused modules?**
  _Cohesion score 0.041666666666666664 - nodes in this community are weakly interconnected._
- **Why does `ldap` connect `ldap` to `grafana/values.yaml`?**
  _High betweenness centrality (0.003) - this node is a cross-community bridge._
- **Should `istio.yml` be split into smaller, more focused modules?**
  _Cohesion score 0.041666666666666664 - nodes in this community are weakly interconnected._
- **Should `steps` be split into smaller, more focused modules?**
  _Cohesion score 0.044326241134751775 - nodes in this community are weakly interconnected._