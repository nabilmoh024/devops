aws_region  = "us-east-1" # change to your region
project     = "devops"
environment = "dev"

vpc_cidr             = "10.0.0.0/16"
az_count             = 2
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]

single_nat_gateway = true
