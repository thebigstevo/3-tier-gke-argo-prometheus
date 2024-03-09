resource "google_compute_network" "k8s_vpc" {
  name = "k8s-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "k8s-subnet" {
  name          = "k8s-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.k8s_vpc.name
}
