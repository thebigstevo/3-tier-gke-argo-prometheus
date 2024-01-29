
output "k8s_cluster_name" {
  value = module.k8s_cluster.name
}

output "k8s_cluster_version" {
  value = module.k8s_cluster.master_version
}

# Include other outputs as needed
