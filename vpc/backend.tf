# Partial backend configuration.
# bucket and region are supplied at init time:
#   terraform init -backend-config=env/dev.backend.hcl
terraform {
  backend "s3" {
    key          = "vpc/terraform.tfstate"
    use_lockfile = true
  }
}
