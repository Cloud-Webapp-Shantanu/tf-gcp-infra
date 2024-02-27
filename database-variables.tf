variable "webapp_database_instance" {
  type        = string
  description = "The name of the webapp database instance"
}

variable "database_version" {
  type        = string
  description = "The database version"
}

variable "database_tier" {
  type        = string
  description = "The tier of the database"
}

variable "database_disk_size" {
  type        = number
  description = "The size of the disk"
}

variable "database_disk_type" {
  type        = string
  description = "The type of the disk"
}

variable "database_name" {
  type        = string
  description = "The name of the database"
}

variable "database_user" {
  type        = string
  description = "The name of the database user"
}

variable "password_length" {
  type        = number
  description = "The length of the password"
}

variable "database_port" {
  type        = number
  description = "The port of the database"
}
