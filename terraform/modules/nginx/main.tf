resource "helm_release" "nginx" {
  depends_on = [module.k8s_cluster]

  repository = "https://charts.bitnami.com/bitnami"
  name       = "nginx"
  chart      = "nginx"
}

