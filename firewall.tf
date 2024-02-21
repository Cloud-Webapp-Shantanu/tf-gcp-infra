# Add firewall rule
resource "google_compute_firewall" "webapp_firewall" {
  name        = var.webapp_firewall
  network     = google_compute_network.vpc.name
  target_tags = var.target_tags

  allow {
    protocol = var.prtocol
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges
}

resource "google_compute_firewall" "ssh_block_firewall" {
  name        = var.webapp_ssh_firewall
  network     = google_compute_network.vpc.name
  target_tags = var.target_tags

  deny {
    protocol = var.prtocol
    ports    = var.ssh_denied_ports
  }

  source_ranges = var.source_ranges
}