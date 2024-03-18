variable "dns_name" {
  description = "The DNS name for the managed zone"
  type        = string
}

variable "managed_zone" {
  description = "The name of the managed zone"
  type        = string
}

variable "a_record" {
  description = "The name of the A record"
  type        = string
}

variable "record_ttl" {
  description = "The TTL of the record"
  type        = number
  default     = 300
}