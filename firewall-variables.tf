variable "webapp_firewall" {
  description = "The name of the firewall rule"
  type        = string
}

variable "source_ranges" {
  description = "The source IP ranges allowed for ingress traffic"
  type        = list(string)
}

variable "target_tags" {
  description = "The target tags for the firewall rule"
  type        = list(string)
}

variable "allowed_ports" {
  description = "The list of allowed ports"
  type        = list(number)
}

variable "ssh_denied_ports" {
  description = "The list of denied ports for SSH"
  type        = list(number)
}

variable "protocol" {
  description = "The protocol for the firewall rule"
  type        = string
}

variable "webapp_ssh_firewall" {
  description = "The name of the SSH firewall rule"
  type        = string
}
