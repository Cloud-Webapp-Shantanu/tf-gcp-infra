# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Define the VPC with regional routing and no auto-created subnets
resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Define the webapp subnet
resource "google_compute_subnetwork" "webapp_subnet" {
  name          = "webapp-subnet"
  region        = var.region
  ip_cidr_range = var.webapp_subnet_cidr
  network       = google_compute_network.vpc.self_link
}

# Define the db subnet
resource "google_compute_subnetwork" "db_subnet" {
  name          = "db-subnet"
  region        = var.region
  ip_cidr_range = var.db_subnet_cidr
  network       = google_compute_network.vpc.self_link
}

# Define a route to 0.0.0.0/0 for the webapp subnet
resource "google_compute_route" "webapp_route" {
  name             = "webapp-route"
  network          = google_compute_network.vpc.name
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
}
