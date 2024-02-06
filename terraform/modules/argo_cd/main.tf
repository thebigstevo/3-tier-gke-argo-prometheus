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
##############################################################################
### Deployment of the argo namespace ###
###############################################################################
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}


resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version = "5.53.12"
  depends_on = [ kubernetes_namespace.argocd ]
  namespace  = kubernetes_namespace.argocd.metadata.0.name

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}

