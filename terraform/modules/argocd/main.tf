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
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  depends_on = [ kubernetes_namespace.argocd ]

#   values = [
#     "${file("values.yaml")}"
#   ]

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}