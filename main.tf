# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Define the VPC with regional routing and no auto-created subnets
resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  routing_mode                    = var.regional
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Define the webapp subnet
resource "google_compute_subnetwork" "webapp_subnet" {
  name          = var.webapp-subnet
  region        = var.region
  ip_cidr_range = var.webapp_subnet_cidr
  network       = google_compute_network.vpc.self_link
}

# Define the db subnet
resource "google_compute_subnetwork" "db_subnet" {
  name                     = var.db-subnet
  region                   = var.region
  ip_cidr_range            = var.db_subnet_cidr
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true
}

# Define a route to 0.0.0.0/0 for the webapp subnet
resource "google_compute_route" "webapp_route" {
  name             = var.webapp-route
  network          = google_compute_network.vpc.name
  dest_range       = var.route-destination-range
  next_hop_gateway = var.next_hop_gateway
}

# Define a global address
resource "google_compute_global_address" "private_ip_address" {
  name          = var.private_ip_address
  purpose       = var.vpc_peering
  address_type  = var.internal
  prefix_length = var.prefix_length
  network       = google_compute_network.vpc.id
}

resource "google_service_networking_connection" "vpc_psc" {
  network                 = google_compute_network.vpc.id
  service                 = var.service_networking_connection
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}