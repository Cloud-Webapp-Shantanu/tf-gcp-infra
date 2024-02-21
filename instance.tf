# Create Compute Engine Instance
resource "google_compute_instance" "webapp_instance" {
  name         = var.webapp_instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.instance_tags
  boot_disk {
    initialize_params {
      image = data.google_compute_image.latest_custom_image.self_link
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    access_config {
      network_tier = var.network_tier
    }

    queue_count = 0
    stack_type  = var.stack_type
    network     = google_compute_network.vpc.self_link
    subnetwork  = google_compute_subnetwork.webapp_subnet.self_link
  }

  metadata = {
    startup-script = file(var.startup_script)
  }
}

data "google_compute_image" "latest_custom_image" {
  family  = var.image_family
  project = var.project_id
}