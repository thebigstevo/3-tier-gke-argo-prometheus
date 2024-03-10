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