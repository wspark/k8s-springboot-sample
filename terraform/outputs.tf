output "cluster_id" {
  description = "EKS cluster ID"
  value       = "education-eks-VDvcQfAm"
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = "https://F49377BCC88C7440EA2438E6B7227C4C.sk1.ap-northeast-2.eks.amazonaws.com"
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = "sg-0c9513affa712229c"
}

output "region" {
  description = "AWS region"
  value       = "ap-northeast-2"
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = "education-eks-VDvcQfAm"
}
