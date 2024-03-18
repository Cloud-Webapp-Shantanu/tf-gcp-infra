# resource "google_dns_managed_zone" "my_zone" {
#   name        = "webapp-zone"
#   dns_name    = "shantanutyagi.me."
#   description = "Managed zone for shantanutyagi.me."
# }

# DNS Record Set for A Record using existing managed zone and instance's public IP
resource "google_dns_record_set" "a_record" {
  name         = var.dns_name
  type         = var.a_record
  ttl          = var.record_ttl
  managed_zone = var.managed_zone
  rrdatas      = [google_compute_instance.webapp_instance.network_interface.0.access_config.0.nat_ip]
}