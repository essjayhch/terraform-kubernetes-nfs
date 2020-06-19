variable "server_storage_size" {
  description = "Size of GCE PD to back this service"
  default = "10Gi"
}


variable "namespace" {
  default = "default"
}

variable "manage_namespace" {
  description = "Whether this module needs to create or maintain the namespace"
  default = false
}

variable "instance" {
  default = "default"
  description = "Instance name"
}
