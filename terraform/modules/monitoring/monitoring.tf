resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "prometheus_stack" {
   name       = var.helm_release_name
   repository = var.repository
   chart      = var.chart
   namespace  = kubernetes_namespace.monitoring.metadata.0.name
   version    = var.release_version
   values     = [file("${path.module}/manifests/values.yaml")]
   depends_on = [ kubernetes_namespace.monitoring ]

}
