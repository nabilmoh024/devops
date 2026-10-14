variable "aws_region" {
  description = "AWS region to deploy the cluster into"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name, used in resource names and tags"
  type        = string
  default     = "devops"
}

variable "environment" {
  description = "Environment name (for example dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "state_bucket" {
  description = "S3 bucket that holds the vpc layer state"
  type        = string
  default     = "arifb084devops"
}

variable "state_bucket_region" {
  description = "Region of the S3 state bucket"
  type        = string
  default     = "ap-south-1"
}

variable "kubernetes_version" {
  description = "Kubernetes <major>.<minor> version for the cluster"
  type        = string
  default     = "1.36"
}

variable "api_allowed_cidrs" {
  description = "CIDR blocks allowed to reach the public Kubernetes API endpoint (use your own IP as x.x.x.x/32)"
  type        = list(string)

  validation {
    condition     = length(var.api_allowed_cidrs) > 0 && alltrue([for c in var.api_allowed_cidrs : can(cidrhost(c, 0)) && c != "0.0.0.0/0"])
    error_message = "Each entry must be a valid CIDR (for example 203.0.113.10/32) and must not be 0.0.0.0/0."
  }
}

variable "admin_principal_arns" {
  description = "Extra IAM user or role ARNs to grant cluster admin (the identity running Terraform is already admin)"
  type        = list(string)
  default     = []
}

variable "node_instance_types" {
  description = "Instance types for the Spot node group (several types improve Spot availability)"
  type        = list(string)
  default     = ["t3a.medium", "t3.medium", "t2.medium"]
}

variable "node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 2
}

variable "node_initial_desired_size" {
  description = "Desired nodes at first creation only (later changes are ignored by the module)"
  type        = number
  default     = 1
}

variable "log_retention_days" {
  description = "Days to keep control plane logs in CloudWatch"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Extra tags applied to all resources"
  type        = map(string)
  default     = {}
}
