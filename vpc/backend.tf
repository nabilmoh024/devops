# Partial backend configuration.
# bucket and region are supplied at init time:
#   terraform init -backend-config=env/dev.backend.hcl
/*
terraform {
  backend "s3" {
    key          = "vpc/terraform.tfstate"
    use_lockfile = true
  }
}
*/
terraform {
  backend "s3" {
    bucket       = "arifb098"
    key          = "vpc/terraform.tfstate" # keep whatever you already have
    region       = "ap-south-1"
    use_lockfile = true # use the region from step 1
    # keep your existing dynamodb_table / use_lockfile line
  }
}
