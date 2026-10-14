terraform {
  # S3 native state locking (use_lockfile) needs Terraform 1.10 or newer
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      # terraform-aws-modules/eks/aws 21.x requires aws provider >= 6.59
      version = "~> 6.59"
    }
  }
}
