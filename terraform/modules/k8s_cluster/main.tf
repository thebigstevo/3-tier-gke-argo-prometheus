#create GKE cluster
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.region
  network  = google_compute_network.k8s_vpc.name
  subnetwork = google_compute_subnetwork.k8s-subnet.name

  remove_default_node_pool = true
  initial_node_count       = 1
}       

#separately managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "my-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 10

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