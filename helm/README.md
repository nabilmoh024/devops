# Helm

Charts and chart repositories for the `devops-dev-eks` cluster, deployed by the
**Helm Deploy** workflow (`.github/workflows/helm.yml`).

## Layout

| Path | Purpose |
| --- | --- |
| `repos.txt` | Helm chart repositories to register (`<name> <https-url>`, one per line) |
| `test-release/` | A small local test chart |

## Helm version

The workflows install Helm **v4.3.1** (`HELM_VERSION` at the top of
`helm.yml`). Helm 4 renamed `--atomic` to `--rollback-on-failure`, which is
what the workflow uses. To change the version, edit `HELM_VERSION`.

## Repositories

A GitHub runner starts empty on every run, so `helm repo add` is not kept
between runs. Each run reads `repos.txt` and adds every repository in it, so
the list in this file is the single source of truth.

To add a repository, add a line to `repos.txt`:

```
istio https://istio-release.storage.googleapis.com/charts
```

## Running the workflow

GitHub, **Actions**, **Helm Deploy**, **Run workflow**:

| Action | What it does | Needs AWS |
| --- | --- | --- |
| `repos` | Installs Helm, adds the repositories in `repos.txt`, and lists the charts found in each | No |
| `lint` | Lints the chosen chart | No |
| `template` | Renders the chosen chart | No |
| `upgrade-install` | Installs or upgrades the chosen chart on the cluster | Yes |
| `uninstall` | Removes the chosen release | Yes |

`chart` and `namespace` only matter for the chart actions and are ignored by
`repos`. The cluster needs running nodes for `upgrade-install` (use the
**EKS Scale Nodes** workflow first).
