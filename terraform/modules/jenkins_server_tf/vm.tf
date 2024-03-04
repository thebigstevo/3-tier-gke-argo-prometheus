resource "google_compute_instance" "jenkins_server" {
  name = "jenkins-server"
  machine_type = "e2-standard-2"
  tags = ["name", "jenkins-server"]
  zone = var.zone
  boot_disk {
    initialize_params {
      # image = "debian-cloud/debian-11"
      image= var.image
      size = 20
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.jenkins_subnet.name
    access_config {
    }
  }
  # metadata_startup_script = "./startup.sh"
}

#allow firewal rule of 22 to the vm
resource "google_compute_firewall" "jenkins_firewall" {
  name = "jenkins-firewall"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports = ["22", "8080", "9000"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["jenkins-server"]
}
