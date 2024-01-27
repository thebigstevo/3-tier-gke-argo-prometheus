##############################################################################
### Deployment of the Trino namespace ###
###############################################################################
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}


resource "helm_release" "argocd" {
  name       = "my-redis-release"
  repository = "https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd"
  chart      = "argocd"
  version    = "5.53.9"

#   values = [
#     "${file("values.yaml")}"
#   ]

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}