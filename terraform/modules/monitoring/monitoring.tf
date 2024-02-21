resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

# resource "helm_release" "prometheus" {
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "prometheus"
#   name       = "prometheus"
#   namespace  = kubernetes_namespace.monitoring.metadata.0.name
#   version    = "25.13.0"
#   depends_on = [ kubernetes_namespace.monitoring ]
#   set {
#     name  = "prometheus.service.type"
#     value = "LoadBalancer"
#   }
  
# }

resource "kubernetes_manifest" "prometheus"{
 manifest = file("${path.module}/manifests/prometheus.yaml")


}
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


# resource "helm_release" "grafana" {
#   name       = "grafana"
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "grafana"
#   namespace  = kubernetes_namespace.monitoring.metadata.0.name
# #   version    = "6.29.1"
#   wait       = "false"
# #   values     = ["${file("values.yaml")}"]
# }
