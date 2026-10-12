# vpc

Network layer. Applied before `eks/`. Uses `terraform-aws-modules/vpc/aws`.

```bash
cd vpc
terraform init -backend-config=env/dev.backend.hcl
terraform fmt
terraform validate
terraform plan -var-file=env/dev.tfvars
```

Run `apply` only after reviewing the plan.
