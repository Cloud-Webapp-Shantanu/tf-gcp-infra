variable "image_family" {
  type        = string
  description = "The image family to use for the VM"
}

variable "webapp_instance_template_name" {
  type        = string
  description = "The name of the webapp instance template"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the VM"
}

variable "zone" {
  type        = string
  description = "The zone to deploy the VM in"
}

variable "boot_disk_size" {
  type        = number
  description = "The size of the boot disk"
}

variable "boot_disk_type" {
  type        = string
  description = "The type of the boot disk"
}

variable "stack_type" {
  type        = string
  description = "The stack type for the network interface"
}

variable "network_tier" {
  type        = string
  description = "The network tier for the network interface"
}

variable "startup_script" {
  type        = string
  description = "The startup script for the VM"
}

variable "instance_tags" {
  type        = list(string)
  description = "The tags to apply to the instance"
}

variable "vm_service_account_id" {
  type        = string
  description = "The id of the service account to use for the VM"
}

variable "vm_service_account_display_name" {
  type        = string
  description = "The display name of the service account to use for the VM"
}

variable "vm_service_account_description" {
  type        = string
  description = "The description of the service account to use for the VM"
}

variable "vm_service_account_scopes" {
  type        = list(string)
  description = "The scopes to apply to the service account"
}

variable "compute_engine_default_service_account" {
  type        = string
  description = "The default service account for the compute engine"

}