variable "aws_region" {
  description = "AWS region to deploy the VPC into"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name, used in resource names and tags"
  type        = string
  default     = "DevOps"
}

variable "environment" {
  description = "Environment name (for example dev, stage, prod)"
  type        = string
  default     = "dev"
}


variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of Availability Zones to use"
  type        = number
  default     = 2
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs, one per AZ"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs, one per AZ"
  type        = list(string)
}

variable "single_nat_gateway" {
  description = "true = one shared NAT gateway for all private subnets (cheaper, suited to dev)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Extra tags applied to all resources"
  type        = map(string)
  default     = {}
}
