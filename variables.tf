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
