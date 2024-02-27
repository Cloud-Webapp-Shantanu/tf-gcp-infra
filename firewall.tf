#Firewall rules for the webapp

# Firewall explicitly denies all traffic
resource "google_compute_firewall" "webapp_denyall_firewall" {
  name        = var.webapp_denyall_firewall
  network     = google_compute_network.vpc.name
  target_tags = var.target_tags
  priority    = 1000

  deny {
    protocol = var.protocol
    ports    = []
  }

  source_ranges = var.source_ranges
}

# Firewall allows ingress traffic on the specified ports with higher priority
resource "google_compute_firewall" "webapp_firewall" {
  name        = var.webapp_firewall
  network     = google_compute_network.vpc.name
  target_tags = var.target_tags
  priority    = 999

  allow {
    protocol = var.protocol
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges
}

# Firewall blocks SSH traffic
resource "google_compute_firewall" "ssh_block_firewall" {
  name        = var.webapp_ssh_firewall
  network     = google_compute_network.vpc.name
  target_tags = var.target_tags

  deny {
    protocol = var.protocol
    ports    = var.denied_ports
  }

  source_ranges = var.source_ranges
}