resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name                        = "${random_id.default.hex}-gcf-source"
  location                    = "US"
  uniform_bucket_level_access = true
}

data "archive_file" "default" {
  type        = "zip"
  output_path = "/tmp/serverless.zip"
  source_dir  = "/Users/shantanutyagi/Documents/Course/Cloud/serverless"
}

resource "google_storage_bucket_object" "object" {
  name   = "serverless.zip"
  bucket = google_storage_bucket.default.name
  source = data.archive_file.default.output_path
}

resource "google_cloudfunctions2_function" "verify_email_function" {
  name        = var.verify_email_function
  location    = var.region
  description = var.verify_email_function_description

  service_config {
    min_instance_count = var.min_instance_count
    max_instance_count = var.max_instance_count
    available_memory   = var.available_memory
    timeout_seconds    = var.timeout_seconds
    vpc_connector      = google_vpc_access_connector.connector.name
    environment_variables = {
      DB_NAME         = google_sql_database.webapp_database.name
      DB_USER         = google_sql_user.webapp_user.name
      DB_PASSWORD     = google_sql_user.webapp_user.password
      DB_PORT         = var.database_port
      DB_HOST         = google_sql_database_instance.webapp_database_instance.private_ip_address
      MAILGUN_API_KEY = var.mailgun_api_key
      DOMAIN          = var.mailgun_domain
    }
  }

  event_trigger {
    trigger_region = var.region
    event_type     = var.trigger_event_type
    pubsub_topic   = google_pubsub_topic.verify_email.id
    retry_policy   = var.retry_policy
  }

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point

    source {
      storage_source {
        bucket = google_storage_bucket.default.name
        object = google_storage_bucket_object.object.name
      }
    }
  }
}