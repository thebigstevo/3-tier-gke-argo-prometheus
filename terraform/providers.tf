# Configure the required providers

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.15.0"
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
  kubernetes {
    host                   = "https://${module.k8s_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = module.k8s_cluster.cluster_ca_certificate
  
  }
}


data "google_client_config" "default" {
}
