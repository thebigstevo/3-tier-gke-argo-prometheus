resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus_stack" {
   name       = "triggermesh-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace = kubernetes_namespace.monitoring.id
  version    = "56.8.2"
  values     = [file("${path.module}/manifests/values.yaml")]
  depends_on = [ kubernetes_namespace.monitoring ]
  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }
  
}

# resource "kubernetes_manifest" "prometheus" {
#   manifest = yamlencode(file("${path.module}/manifests/prometheus.yaml")) 
# }
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
