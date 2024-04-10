# Create a Service Account for the VM Instance
resource "google_service_account" "gcp_sa_cloud_vm" {
  account_id   = var.vm_service_account_id
  display_name = var.vm_service_account_display_name
  description  = var.vm_service_account_description
  project      = var.project_id
}

resource "google_service_account" "gcp_sa_cloud_function" {
  account_id   = var.gcp_sa_cloud_function_id
  display_name = var.gcp_sa_cloud_function_display_name
  project      = var.project_id
}

resource "google_project_service_identity" "gcp_sa_cloud_sql" {
  provider = google-beta
  project  = var.project_id
  service  = var.gcp_sa_cloud_sql_service
}

data "google_storage_project_service_account" "gcs_account" {
}