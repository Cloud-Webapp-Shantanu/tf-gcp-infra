variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region where resources will be created"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "webapp_subnet_cidr" {
  type        = string
  description = "The CIDR range for the webapp subnet"
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  type        = string
  description = "The CIDR range for the db subnet"
  default     = "10.0.2.0/24"
}

variable "webapp-subnet" {
  type        = string
  description = "The name of the Webapp subnet"
}

variable "db-subnet" {
  type        = string
  description = "The name of the db subnet"
}

variable "connector_subnet" {
  type        = string
  description = "The name of the connector subnet"
}

variable "connector_subnet_cidr" {
  type        = string
  description = "The CIDR range for the connector subnet"
}

variable "webapp-route" {
  type        = string
  description = "The name of the webapp route"
}

variable "route-destination-range" {
  type        = string
  description = "The destination range for the route"
}

variable "regional" {
  type    = string
  default = "REGIONAL"
}

variable "next_hop_gateway" {
  type        = string
  description = "The next hop for the route"
}

variable "service_networking_connection" {
  type        = string
  description = "The service networking connection"
}

variable "private_ip_address" {
  type        = string
  description = "The private IP address"

}

variable "vpc_peering" {
  type        = string
  description = "The purpose of the global address as VPC peering"
}

variable "internal" {
  type        = string
  description = "The internal address type"
}

variable "prefix_length" {
  type        = number
  description = "The prefix length for the global address"
  default     = 16
}

variable "connector" {
  type        = string
  description = "The name of the VPC access connector"
}

variable "connector_machine_type" {
  type        = string
  description = "The machine type for the VPC access connector"
}