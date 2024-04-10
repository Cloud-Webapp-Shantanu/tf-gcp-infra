# CloudSQL Database Instance
resource "google_sql_database_instance" "webapp_database_instance" {
  name                = var.webapp_database_instance
  region              = var.region
  deletion_protection = false
  database_version    = var.database_version
  depends_on          = [google_service_networking_connection.vpc_psc]
  encryption_key_name = google_kms_crypto_key.webapp_sql_key.id
  settings {
    tier              = var.database_tier
    disk_size         = var.database_disk_size
    disk_type         = var.database_disk_type
    availability_type = var.regional
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.self_link
    }
  }
}

# CloudSQL Database
resource "google_sql_database" "webapp_database" {
  name     = var.database_name
  instance = google_sql_database_instance.webapp_database_instance.name
}

# CloudSQL Database User
resource "google_sql_user" "webapp_user" {
  name     = var.database_user
  instance = google_sql_database_instance.webapp_database_instance.name
  password = random_password.webapp_password.result
}

# Random Password Generation
resource "random_password" "webapp_password" {
  length  = var.password_length
  special = false
  upper   = true
  lower   = true
  numeric = true
}