
output "k8s_cluster_name" {
  value = module.k8s_cluster.name
}

output "k8s_cluster_version" {
  value = module.k8s_cluster.master_version
}

output "k8s_cluster_endpoint" {
  value = module.k8s_cluster.endpoint
}
output "k8s_cluster_ca_certificate" {

  value = module.k8s_cluster.cluster_ca_certificate
}

