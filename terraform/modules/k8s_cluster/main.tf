#create GKE cluster
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.zone
  network  = google_compute_network.k8s_vpc.name
  subnetwork = google_compute_subnetwork.k8s-subnet.name

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