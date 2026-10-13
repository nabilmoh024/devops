# Reads the outputs of the vpc layer from its S3 state (apply vpc/ first)
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = "vpc/terraform.tfstate"
    region = var.state_bucket_region
  }
}
