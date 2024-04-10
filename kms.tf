resource "random_id" "random_suffix" {
  byte_length = 4
}

resource "google_kms_key_ring" "webapp-keyring" {
  provider = google-beta
  name     = "${var.key_ring_name}-${random_id.random_suffix.hex}"
  project  = var.project_id
  location = var.region
}

resource "google_kms_crypto_key" "webapp_sql_key" {
  provider        = google-beta
  name            = var.webapp_sql_key
  key_ring        = google_kms_key_ring.webapp-keyring.id
  rotation_period = var.rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key" "webapp_vm_key" {
  provider        = google-beta
  name            = var.webapp_vm_key
  key_ring        = google_kms_key_ring.webapp-keyring.id
  rotation_period = var.rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key" "webapp_bucket_key" {
  provider        = google-beta
  name            = var.webapp_bucket_key
  key_ring        = google_kms_key_ring.webapp-keyring.id
  rotation_period = var.rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }
}