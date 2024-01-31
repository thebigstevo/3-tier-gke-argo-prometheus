resource "helm_release" "nginx" {
  repository = "https://charts.bitnami.com/bitnami"
  name       = "nginx"
  chart      = "nginx"
  namespace = kubernetes_namespace_v1.myname.metadata[0].name
  depends_on = [ kubernetes_namespace_v1.myname ]
}

resource "kubernetes_namespace_v1" "myname" {
  metadata {
    name = "nginx"
  }
 
}