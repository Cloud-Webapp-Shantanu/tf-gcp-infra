resource "google_compute_global_address" "lb_ip_address" {
  name       = var.lb_ip_address_name
  ip_version = var.lb_ip_address_version
  project    = var.project_id
}

resource "google_compute_backend_service" "lb_backend_service" {
  name                            = var.lb_backend_service_name
  project                         = var.project_id
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.webapp_health_check.id]
  load_balancing_scheme           = var.load_balancing_scheme
  port_name                       = var.port_name
  protocol                        = var.http_protocol
  session_affinity                = var.session_affinity
  timeout_sec                     = var.timeout_sec
  backend {
    group           = google_compute_region_instance_group_manager.webapp_instance_group_manager.instance_group
    balancing_mode  = var.balancing_mode
    capacity_scaler = var.capacity_scaler
  }
  log_config {
    enable = true
  }
}

resource "google_compute_url_map" "default" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.lb_backend_service.id
}

resource "google_compute_managed_ssl_certificate" "lb_default" {
  provider = google-beta
  name     = var.ssl_certificate_name
  project  = var.project_id
  lifecycle {
    create_before_destroy = true
  }
  managed {
    domains = var.domains
  }
}

resource "google_compute_target_https_proxy" "lb_default" {
  provider = google-beta
  name     = var.target_https_proxy_name
  url_map  = google_compute_url_map.default.id
  project  = var.project_id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.lb_default.name
  ]
  depends_on = [
    google_compute_managed_ssl_certificate.lb_default
  ]
}

resource "google_compute_global_forwarding_rule" "default" {
  provider              = google-beta
  project               = var.project_id
  name                  = var.forwarding_rule_name
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  target                = google_compute_target_https_proxy.lb_default.id
  ip_address            = google_compute_global_address.lb_ip_address.id
}