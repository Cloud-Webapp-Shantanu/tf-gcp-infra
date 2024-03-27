resource "google_pubsub_topic" "verify_email" {
  name                       = var.pubsub_topic_name
  message_retention_duration = var.message_retention_duration
}

resource "google_pubsub_subscription" "verify_email_subscription" {
  name                       = var.verify_email_subscription
  topic                      = google_pubsub_topic.verify_email.name
  ack_deadline_seconds       = var.ack_deadline_seconds
  message_retention_duration = var.message_retention_duration
}