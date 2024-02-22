# module "jenkins_server" {
#   source = "./modules/jenkins_server_tf"
# }

module "k8s_cluster" {
  source = "./modules/k8s_cluster"
}

module "argo_cd" {
  source = "./modules/argo_cd"
  depends_on = [ module.k8s_cluster ]
}

module "monitoring" {
  source = "./modules/monitoring"
  depends_on = [ module.k8s_cluster , module.argo_cd]
}
# module "nginx" {
#   source = "./modules/nginx"
#   depends_on = [ module.k8s_cluster ]
# }
