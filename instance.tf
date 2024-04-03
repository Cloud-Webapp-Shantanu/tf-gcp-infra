# Create a Service Account for the VM Instance
resource "google_service_account" "logging_sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  description  = var.service_account_description
  project      = var.project_id
}

data "google_compute_image" "latest_custom_image" {
  family  = var.image_family
  project = var.project_id
}

resource "google_compute_region_instance_template" "webapp_instance_template" {
  name         = var.webapp_instance_template_name
  machine_type = var.machine_type
  region       = var.region
  disk {
    source_image = data.google_compute_image.latest_custom_image.self_link
    disk_size_gb = var.boot_disk_size
    type         = var.boot_disk_type
  }
  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.webapp_subnet.self_link
    # Uncomment/Comment the following block to enable/disable external IP
    access_config {
      network_tier = var.network_tier
    }
  }
  metadata = {
    startup-script = templatefile(var.startup_script, {
      DB_NAME           = google_sql_database.webapp_database.name
      DB_USER           = google_sql_user.webapp_user.name
      DB_PASSWORD       = google_sql_user.webapp_user.password
      DB_PORT           = var.database_port
      DB_HOST           = google_sql_database_instance.webapp_database_instance.private_ip_address
      PUBSUB_TOPIC_NAME = var.pubsub_topic_name
      TOKEN_EXPIRY      = var.token_expiry
    })
  }
  service_account {
    email  = google_service_account.logging_sa.email
    scopes = var.service_account_scopes
  }
  tags = var.instance_tags
}