variable "key_ring_name" {
  type        = string
  description = "The name of the key ring"
}

variable "webapp_sql_key" {
  type        = string
  description = "The name of the KMS key to use for encrypting/decrypting SQL data"
}

variable "webapp_vm_key" {
  type        = string
  description = "The name of the KMS key to use for encrypting/decrypting SQL data"
}

variable "webapp_bucket_key" {
  type        = string
  description = "The name of the KMS key to use for encrypting/decrypting cloud bucket"
}

variable "rotation_period" {
  type        = string
  description = "The rotation period for the KMS key"
}

variable "purpose" {
  type        = string
  description = "The purpose of the KMS key"
}