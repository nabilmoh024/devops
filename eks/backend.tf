# Partial backend configuration.
# bucket and region are supplied at init time:
#   terraform init -backend-config=env/dev.backend.hcl
terraform {
  backend "s3" {
    bucket       = "arifb098"
    key          = "eks/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
