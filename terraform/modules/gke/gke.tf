resource "google_container_cluster" "primary" {
  name               = var.gke_cluster_name
  project            = var.gke_project
  location           = var.gke_region
  network            = var.gke_vpc
  subnetwork         = var.gke_subnet
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "my-node-pool"
  location   = var.gke_region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.gke_sa
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
