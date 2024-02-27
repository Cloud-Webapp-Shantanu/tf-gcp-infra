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
    startup-script = templatefile(var.startup_script, {
      DB_NAME     = google_sql_database.webapp_database.name
      DB_USER     = google_sql_user.webapp_user.name
      DB_PASSWORD = google_sql_user.webapp_user.password
      DB_PORT     = var.database_port
      DB_HOST     = google_sql_database_instance.webapp_database_instance.private_ip_address
    })
  }
}

data "google_compute_image" "latest_custom_image" {
  family  = var.image_family
  project = var.project_id
}