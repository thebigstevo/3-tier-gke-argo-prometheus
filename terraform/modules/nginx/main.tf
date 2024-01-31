resource "helm_release" "nginx" {
  repository = "https://charts.bitnami.com/bitnami"
  name       = "nginx"
  chart      = "nginx"
}

# resource "kubernetes_namespace_v1" "myname" {
#   metadata {
#     name = "myname"
#   }
 
# }