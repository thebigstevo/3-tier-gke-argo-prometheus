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
  project = "my-POCs"
  region  = "us-west4"
  zone    = "us-west4-a"
}


