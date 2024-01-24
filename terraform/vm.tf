resource "google_compute_instance" "jenkins_server" {
  name = "jenkins-server"
  machine_type = "e2-micro"
  zone = var.zone
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.jenkins_subnet.name
    access_config {
    }
  }
}