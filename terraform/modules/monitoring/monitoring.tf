resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

# resource "helm_release" "prometheus_stack" {
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#   name       = "prometheus-grafana"
#   namespace  = kubernetes_namespace.monitoring.metadata.0.name
#   version    = "15.0.0"
#   depends_on = [ kubernetes_namespace.monitoring ]
# #   set {
# #      name  = "grafana.service.type"
# #      value = "LoadBalancer"
# #   }
# #   set {
# #     name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
# #     value = "false"
# #   }
# #   set {
# #     name  = "prometheus.prometheusSpec.serviceMonitorSelector"
# #     value = "{}"
# #   }
# #   set {
# #     name  = "prometheus.service.type"
# #     value = "LoadBalancer"
# #   }
  
# }

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = kubernetes_namespace.monitoring.metadata.0.name
#   version    = "6.29.1"
  wait       = "false"
#   values     = ["${file("values.yaml")}"]
}
