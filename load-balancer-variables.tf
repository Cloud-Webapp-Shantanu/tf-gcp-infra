variable "lb_ip_address_name" {
  description = "The name of the global IP address for the load balancer"
  type        = string
}

variable "lb_ip_address_version" {
  description = "The IP version for the global IP address"
  type        = string
}

variable "lb_backend_service_name" {
  description = "The name of the backend service for the load balancer"
  type        = string
}

variable "load_balancing_scheme" {
  description = "Load balancing scheme"
  type        = string
}

variable "port_name" {
  description = "The name of the port"
  type        = string
}

variable "http_protocol" {
  description = "HTTP protocol for the backend service"
  type        = string
}

variable "session_affinity" {
  description = "The session affinity for the backend service"
  type        = string
}

variable "timeout_sec" {
  description = "The timeout for the backend service"
  type        = number
}

variable "balancing_mode" {
  description = "The balancing mode for the backend service"
  type        = string
}

variable "capacity_scaler" {
  description = "The capacity scaler for the backend service"
  type        = number
}

variable "url_map_name" {
  description = "The name of the URL map"
  type        = string
}

variable "ssl_certificate_name" {
  description = "The name of the SSL certificate"
  type        = string
}

variable "domains" {
  description = "The domains for the SSL certificate"
  type        = list(string)
}

variable "target_https_proxy_name" {
  description = "The name of the target HTTPS proxy"
  type        = string
}

variable "forwarding_rule_name" {
  description = "The name of the forwarding rule"
  type        = string
}

variable "ip_protocol" {
  description = "The IP protocol for the forwarding rule"
  type        = string
}

variable "port_range" {
  description = "The port range for the forwarding rule"
  type        = string
}
