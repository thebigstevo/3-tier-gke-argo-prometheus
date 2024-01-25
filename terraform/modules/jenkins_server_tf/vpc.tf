resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  name                    = "three-tier-vpc-network"
}


resource "google_compute_subnetwork" "jenkins_subnet" {
  project       = var.project_id
  name          = "jenkins-subnet"
  ip_cidr_range = "10.0.3.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.name

}
