variable "gcp_sa_cloud_sql_service" {
  type        = string
  description = "The service to use for the Cloud SQL sa"
}

variable "gcp_sa_cloud_function_id" {
  type        = string
  description = "The id of the service account to use for the Cloud Function"
}

variable "gcp_sa_cloud_function_display_name" {
  type        = string
  description = "The display name of the service account to use for the Cloud Function"
}