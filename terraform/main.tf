module "jenkins_server" {
  source = "./modules/jenkins_server_tf"
}

module "k8s_cluster" {
  source = "./modules/k8s_cluster"
}

