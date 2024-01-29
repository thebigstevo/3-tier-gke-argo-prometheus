##############################################################################
### Deployment of the Trino namespace ###
###############################################################################
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubectl_manifest" "argo_namespace" {
  yaml_body = file("argo_namespace.yaml")
}
# resource "helm_release" "argocd" {
#   name       = "my-redis-release"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   depends_on = [ kubernetes_namespace.argocd ]
#   namespace  = kubernetes_namespace.argocd.metadata.0.name
# #   values = [
# #     "${file("values.yaml")}"
# #   ]

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }
# }