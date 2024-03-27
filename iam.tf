resource "google_project_iam_binding" "logging_admin" {
  project = var.project_id
  role    = "roles/logging.admin"

  members = [
    "serviceAccount:${google_service_account.logging_sa.email}"
  ]
}

resource "google_project_iam_binding" "monitoring_metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"

  members = [
    "serviceAccount:${google_service_account.logging_sa.email}"
  ]
}

# Roles for publishing to Pub/Sub 
resource "google_pubsub_topic_iam_binding" "pubsub_topic_publisher_binding" {
  topic = google_pubsub_topic.verify_email.name
  role  = "roles/pubsub.publisher"

  members = [
    "serviceAccount:${google_service_account.logging_sa.email}"
  ]
}

