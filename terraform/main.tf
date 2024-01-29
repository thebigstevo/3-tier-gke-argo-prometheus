module "jenkins_server" {
  source = "./modules/jenkins_server_tf"
}

module "k8s_cluster" {
  source = "./modules/k8s_cluster"
}

module "argo_cd" {
  source = "./modules/argocd"
  depends_on = [ module.k8s_cluster ]
}

module "nginx" {
  source = "./modules/nginx"
  depends_on = [ module.k8s_cluster ]
}
data "google_client_config" "default" {
}
