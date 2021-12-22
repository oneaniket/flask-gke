resource "google_compute_network" "vpc_network" {
  name                    = "gke-flask-vpc"
  project                 = var.vpc_project
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnets" {
  name          = "subnet1"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.vpc_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "default" {
  name    = "flask-5000"
  project = var.vpc_project
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  source_ranges = ["0.0.0.0"]

}


output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.subnets.id
}
