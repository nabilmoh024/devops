aws_region  = "ap-south-1"
project     = "devops"
environment = "dev"

# State bucket of the vpc layer (same as vpc/env/dev.backend.hcl)
state_bucket        = "arifb084devops"
state_bucket_region = "ap-south-1"

kubernetes_version = "1.36"

# REQUIRED: replace with your public IP, for example "203.0.113.10/32".
# Plan fails until this is a valid CIDR (0.0.0.0/0 is rejected).
api_allowed_cidrs = ["REPLACE_WITH_YOUR_IP/32"]

# Optional: IAM user/role ARNs that need kubectl admin besides the Terraform identity
admin_principal_arns = []

node_instance_types       = ["t3a.medium", "t3.medium", "t2.medium"]
node_max_size             = 2
node_initial_desired_size = 1
log_retention_days        = 1
