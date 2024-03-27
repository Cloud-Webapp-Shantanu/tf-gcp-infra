resource "google_pubsub_topic" "verify_email" {
  name = var.pubsub_topic_name
}