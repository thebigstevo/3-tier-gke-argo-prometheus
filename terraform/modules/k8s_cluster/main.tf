#create GKE cluster
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.zone
  network  = google_compute_network.k8s_vpc.name
  subnetwork = google_compute_subnetwork.k8s-subnet.name
  min_master_version = "1.28"

  remove_default_node_pool = true
  initial_node_count       = 1

}       

#separately managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool-1"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    # oauth_scopes    = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]       
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}    

#Add a persistent Volume claim
resource "kubernetes_persistent_volume_claim_v1" "mypvc" {
  metadata {
    name = "mypvcclaimname"
  }
   spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume_v1.mypv.metadata.0.name}"

}
}

#Add a persistent volume

resource "kubernetes_persistent_volume_v1" "mypv" {
  metadata {
    name = "myvolumename"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      gce_persistent_disk {
        pd_name = google_compute_disk.mydisk.name
      }
    }
  }
}

resource "google_compute_disk" "mydisk" {
  name         = "test-123"  # Replace with desired name
  type         = "pd-standard"  # Adjust disk type (e.g., pd-ssd)
  zone          = var.zone  # Use the same zone as your cluster
  size         = var.disk_size_gb  # Specify desired disk size

  # Optional: Add labels or other disk configuration options
}