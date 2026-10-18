# Istio on EKS

Installs Istio on the `devops-dev-eks` cluster with the official Helm charts,
deployed by the **Istio Deploy** GitHub Actions workflow
(`.github/workflows/istio.yml`).

## Layout

| Path | Purpose |
| --- | --- |
| `istiod-values.yaml` | Values for the `istio/istiod` chart (control plane and sidecar sizing) |
| `gateway-values.yaml` | Values for the `istio/gateway` chart (optional ingress gateway) |
| `manifests/` | Plain Istio resources applied with `kubectl apply` after install |

The `istio/base` chart (CRDs) uses its defaults, so it has no values file.
Add any new Istio resource (Gateway, VirtualService, AuthorizationPolicy, ...)
as a YAML file in `manifests/` and the workflow applies it.

## What gets installed

| Release | Chart | Namespace |
| --- | --- | --- |
| `istio-base` | `istio/base` | `istio-system` |
| `istiod` | `istio/istiod` | `istio-system` |
| `istio-ingress` (optional) | `istio/gateway` | `istio-ingress` |

Chart repo: `https://istio-release.storage.googleapis.com/charts`.
The default version is **1.31.2**, which supports Kubernetes 1.32-1.37
(the cluster runs 1.36).

## Deploying

1. Make sure the cluster has nodes. If it was scaled to 0, run the
   **EKS Scale Nodes** workflow first. The Istio workflow stops with a clear
   error when there are no Ready nodes.
2. GitHub, **Actions**, **Istio Deploy**, **Run workflow**:

| Input | Meaning |
| --- | --- |
| `action` | `validate` renders the charts and checks the YAML, no AWS needed. `install` installs or upgrades everything. `status` shows releases and pods. `uninstall` removes everything. |
| `version` | Istio version, default `1.31.2`. Change it to upgrade. |
| `install_gateway` | Also install the ingress gateway (default off) |
| `inject_namespace` | Optional. Label this namespace `istio-injection=enabled` so new pods get a sidecar |

It uses the same repository secrets and variable as the other workflows:
`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_REGION`. It shares the
`terraform-eks-dev` concurrency group, so it never runs at the same time as a
Terraform, Helm or scale run on the same cluster.

## Notes

- **Sizing:** the node group is spot `t3.small` (2 GiB). The chart default of
  2 GiB for istiod would not fit, so the values files set small requests.
- **Sidecars:** only pods in namespaces labelled `istio-injection=enabled` get
  one, and only pods created after the label. Restart existing deployments
  with `kubectl rollout restart deployment -n <namespace>`.
- **CRDs:** Helm does not upgrade or delete CRDs. After uninstalling, the
  `*.istio.io` CRDs stay in the cluster. Check the Istio release notes before
  jumping minor versions.
- **Gateway:** it is `ClusterIP` by default, so there is no load balancer cost.
  See `gateway-values.yaml` for how to expose it.
- **Quick check:** `kubectl -n istio-system get pods` should show `istiod` as
  `Running`.
