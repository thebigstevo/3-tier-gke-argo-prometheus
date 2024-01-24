resource "google_compute_instance" "name" {
  name = "jenkins-server"
  machine_type = "e2-micro"
  zone = var.zone
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}