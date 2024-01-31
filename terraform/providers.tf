# Configure the required providers

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

# Configure the Google Cloud Provider


provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "helm" {
   alias =                 "gcp"
  kubernetes {
    host                   = "https://${module.k8s_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = module.k8s_cluster.cluster_ca_certificate
  
  }
}

provider "kubectl" {
    alias                  = "gcp"
    host                   = "https://${module.k8s_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = module.k8s_cluster.cluster_ca_certificate
    load_config_file       = false
  
}



# provider "kubectl" {
#   alias                  = "gcp"
#   load_config_file       = false
#   host                   = "https://${module.gcp_triggermesh_infra.gke_cluster_host}"
#   token                  = data.google_client_config.current.access_token
#   cluster_ca_certificate = base64decode(module.gcp_triggermesh_infra.gke_cluster_ca_certificate)
# }

# provider "helm" {
#   alias = "gcp"

#   kubernetes {
#     host                   = "https://${module.gcp_triggermesh_infra.gke_cluster_host}"
#     token                  = data.google_client_config.current.access_token
#     cluster_ca_certificate = base64decode(module.gcp_triggermesh_infra.gke_cluster_ca_certificate)
#   }
# }