variable "verify_email_function" {
  type        = string
  description = "The name of the Cloud Function"
}

variable "verify_email_function_description" {
  type        = string
  description = "The description of the Cloud Function"
}

variable "available_memory" {
  type        = string
  description = "The memory available to the Cloud Function"
}

variable "min_instance_count" {
  type        = number
  description = "The minimum number of instances for the Cloud Function"
}

variable "max_instance_count" {
  type        = number
  description = "The maximum number of instances for the Cloud Function"
}

variable "timeout_seconds" {
  type        = number
  description = "The timeout for the Cloud Function"
}

variable "mailgun_api_key" {
  type        = string
  description = "The Mailgun API key"
}

variable "mailgun_domain" {
  type        = string
  description = "The domain for sending emails"
}

variable "trigger_event_type" {
  type        = string
  description = "The event type for the Cloud Function"
}

variable "retry_policy" {
  type        = string
  description = "The retry policy for the Cloud Function"
}

variable "runtime" {
  type        = string
  description = "The runtime for the Cloud Function"
}

variable "entry_point" {
  type        = string
  description = "The entry point for the Cloud Function"
}

variable "cloudfunction_sa" {
  type        = string
  description = "The service account for the Cloud Function"
}

variable "cloudfunction_sa_description" {
  type        = string
  description = "The description of the service account for the Cloud Function"
}

variable "cloudfunction_sa_display_name" {
  type        = string
  description = "The display name of the service account for the Cloud Function"

}