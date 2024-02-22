resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus_stack" {
   name       = "triggermesh-prometheus"
   repository = "https://prometheus-community.github.io/helm-charts"
   chart      = "kube-prometheus-stack"
   namespace  = kubernetes_namespace.monitoring.metadata.0.name
   version    = "56.8.2"
   values     = [file("${path.module}/manifests/values.yaml")]
   depends_on = [ kubernetes_namespace.monitoring ]

}
