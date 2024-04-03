variable "webapp_health_check" {
  description = "The name of the health check used by the autoscaler"
  type        = string
}

variable "check_interval_sec" {
  description = "How often (in seconds) to check the health of the backend service"
  type        = number
}

variable "health_check_timeout_sec" {
  description = "How long (in seconds) to wait for a response from the backend before considering it a failed request"
  type        = number
}

variable "healthy_threshold" {
  description = "The number of consecutive successful health checks before considering the backend healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "The number of consecutive failed health checks before considering the backend unhealthy"
  type        = number
}

variable "port" {
  description = "The port number to use for the health check"
  type        = number
}

variable "request_path" {
  description = "The request path to use for the health check"
  type        = string
}

variable "autoscaler_name" {
  description = "The name of the autoscaler"
  type        = string
}

variable "min_replicas" {
  description = "The minimum number of replicas the autoscaler can scale down to"
  type        = number
}

variable "max_replicas" {
  description = "The maximum number of replicas the autoscaler can scale up to"
  type        = number
}

variable "cooldown_period" {
  description = "The number of seconds to wait before starting to scale again after the last scaling operation"
  type        = number
}

variable "cpu_utilization_target" {
  description = "The target CPU utilization for the autoscaler"
  type        = number
}

variable "instance_group_manager_name" {
  description = "The name of the instance group manager"
  type        = string
}

variable "base_instance_name" {
  description = "The base name of the instances in the group"
  type        = string
}

variable "target_size" {
  description = "The target number of instances in the group"
  type        = number
}

variable "named_port_name" {
  description = "The name of the named port"
  type        = string
}

variable "initial_delay_sec" {
  description = "The number of seconds to wait before starting to check the health of the instances"
  type        = number
}