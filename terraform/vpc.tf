resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  name                    = "vpc-network"
}

resource "google_compute_subnetwork" "k8s-subnet" {
  name          = "k8s-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "jenkins_subnet" {
  project       = var.project_id
  name          = "jenkins-subnet"
  ip_cidr_range = "10.0.3.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name

}
