variable "pubsub_topic_name" {
  type        = string
  description = "The name of the Pub/Sub topic"
}

variable "token_expiry" {
  type        = number
  description = "The expiry time of the token"
}

variable "verify_email_subscription" {
  type        = string
  description = "The name of the Pub/Sub subscription"
}

variable "message_retention_duration" {
  type        = string
  description = "The duration for which the message is retained"
}

variable "ack_deadline_seconds" {
  type        = number
  description = "The deadline for acknowledging the message"
}