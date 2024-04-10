resource "google_project_iam_binding" "logging_admin" {
  project = var.project_id
  role    = "roles/logging.admin"

  members = [
    "serviceAccount:${google_service_account.gcp_sa_cloud_vm.email}"
  ]
}

resource "google_project_iam_binding" "monitoring_metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"

  members = [
    "serviceAccount:${google_service_account.gcp_sa_cloud_vm.email}"
  ]
}

# Roles for publishing to Pub/Sub 
resource "google_pubsub_topic_iam_binding" "pubsub_topic_publisher_binding" {
  topic = google_pubsub_topic.verify_email.name
  role  = "roles/pubsub.publisher"

  members = [
    "serviceAccount:${google_service_account.gcp_sa_cloud_vm.email}"
  ]
}

resource "google_project_iam_member" "pubsub_sa_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.gcp_sa_cloud_vm.email}"
}

resource "google_project_iam_binding" "service_account_crypto" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  members = [
    "serviceAccount:${google_project_service_identity.gcp_sa_cloud_sql.email}"
  ]
}

resource "google_kms_crypto_key_iam_binding" "sql_crypto_encrypter_decrypter" {
  crypto_key_id = google_kms_crypto_key.webapp_sql_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${google_project_service_identity.gcp_sa_cloud_sql.email}"
  ]
}

resource "google_kms_crypto_key_iam_binding" "storage_crypto_encrypter_decrypter" {
  crypto_key_id = google_kms_crypto_key.webapp_bucket_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
  ]
}

resource "google_kms_crypto_key_iam_binding" "vm_crypto_encrypter_decrypter" {
  crypto_key_id = google_kms_crypto_key.webapp_vm_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${var.compute_engine_default_service_account}"
  ]
}

