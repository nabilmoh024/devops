locals {
  name = "${var.project}-${var.environment}"

  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnets = data.terraform_remote_state.vpc.outputs.private_subnets

  tags = merge(var.tags, {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
  })

  # Optional extra cluster admins (for example the IAM user you use with kubectl)
  admin_access_entries = {
    for arn in var.admin_principal_arns : arn => {
      principal_arn = arn
      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.29"

  name               = "${local.name}-eks"
  kubernetes_version = var.kubernetes_version

  vpc_id     = local.vpc_id
  subnet_ids = local.private_subnets

  # Public API endpoint, restricted to the CIDRs you list
  endpoint_public_access       = true
  endpoint_public_access_cidrs = var.api_allowed_cidrs
  endpoint_private_access      = true

  # The identity that runs Terraform becomes a cluster admin
  enable_cluster_creator_admin_permissions = true
  access_entries                           = local.admin_access_entries

  # Stay on standard support (no extended-support surcharge)
  upgrade_policy = {
    support_type = "STANDARD"
  }

  # Keep control plane logs, but only for a short time
  cloudwatch_log_group_retention_in_days = var.log_retention_days

  addons = {
    vpc-cni = {
      before_compute = true
    }
    kube-proxy = {}
    coredns    = {}
  }

  # Istio: lets the EKS control plane call istiod's injection and validation
  # webhooks (container port 15017) on the nodes
  node_security_group_additional_rules = {
    ingress_cluster_istio_webhook = {
      description                   = "Cluster API to Istio webhooks (istiod)"
      protocol                      = "tcp"
      from_port                     = 15017
      to_port                       = 15017
      type                          = "ingress"
      source_cluster_security_group = true
    }
  }

  eks_managed_node_groups = {
    spot = {
      ami_type       = "AL2023_x86_64_STANDARD"
      capacity_type  = "SPOT"
      instance_types = var.node_instance_types

      # min 0 allows scaling to zero. The module ignores later changes to
      # desired_size, so day-to-day scaling is done with the eks-scale workflow.
      min_size     = 0
      max_size     = var.node_max_size
      desired_size = var.node_initial_desired_size
    }
  }

  tags = local.tags
}
