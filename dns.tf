# DNS Record Set for A Record using existing managed zone and instance's public IP
resource "google_dns_record_set" "a_record" {
  name         = var.dns_name
  type         = var.a_record
  ttl          = var.record_ttl
  managed_zone = var.managed_zone
  rrdatas      = [google_compute_global_address.lb_ip_address.address]
}