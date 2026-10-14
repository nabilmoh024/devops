output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "node_autoscaling_group_names" {
  description = "Auto Scaling group names created by the managed node group(s)"
  value       = module.eks.eks_managed_node_groups_autoscaling_group_names
}
