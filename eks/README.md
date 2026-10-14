# eks

Cluster layer. Apply `vpc/` first: this layer reads the VPC and private subnet IDs
from the vpc state (`vpc/terraform.tfstate`) with `terraform_remote_state`.

Uses `terraform-aws-modules/eks/aws`, one Spot managed node group (min 0 nodes).

```bash
cd eks
terraform init -backend-config=env/dev.backend.hcl
terraform fmt
terraform validate
terraform plan -var-file=env/dev.tfvars
```

Before planning, set `api_allowed_cidrs` in `env/dev.tfvars` to your public IP (`x.x.x.x/32`).
Run `apply` only after reviewing the plan.
