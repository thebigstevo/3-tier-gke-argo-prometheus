##############################################################################
### Deployment of the argo namespace ###
###############################################################################
# resource "kubernetes_namespace" "argocd" {
#   metadata {
#     name = "argocd"
#   }
# }


data "local_file" "argo_namespace_manifest" {
  filename = "${path.module}/argo_namespace.yaml"
}

resource "kubectl_manifest" "argo_namespace" {
  yaml_body = data.local_file.argo_namespace_manifest.content
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

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.15.0"
    }
    helm={
      source = "hashicorp/helm"
     
    }
 
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }
}