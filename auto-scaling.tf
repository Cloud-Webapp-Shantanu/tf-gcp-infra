resource "google_compute_health_check" "webapp_health_check" {
  name                = var.webapp_health_check
  check_interval_sec  = var.check_interval_sec
  timeout_sec         = var.timeout_sec
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  http_health_check {
    port         = var.port
    request_path = var.request_path
  }
  log_config {
    enable = true
  }
}

resource "google_compute_region_autoscaler" "webapp_autoscaler" {
  name   = var.autoscaler_name
  region = var.region
  target = google_compute_region_instance_group_manager.webapp_instance_group_manager.id
  autoscaling_policy {
    min_replicas    = var.min_replicas
    max_replicas    = var.max_replicas
    cooldown_period = var.cooldown_period
    cpu_utilization {
      target = var.cpu_utilization_target
    }
  }
}

resource "google_compute_region_instance_group_manager" "webapp_instance_group_manager" {
  name               = var.instance_group_manager_name
  base_instance_name = var.base_instance_name
  region             = var.region
  target_size        = var.target_size
  version {
    instance_template = google_compute_region_instance_template.webapp_instance_template.self_link
  }
  distribution_policy_zones = var.distribution_policy_zones
  named_port {
    name = var.named_port_name
    port = var.port
  }
  auto_healing_policies {
    health_check      = google_compute_health_check.webapp_health_check.id
    initial_delay_sec = var.initial_delay_sec
  }
}