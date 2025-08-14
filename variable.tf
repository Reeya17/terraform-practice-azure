variable "prefix" {
  default = "tfvmex"
}
variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "staging"
}
variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default = "westeurope"
}
variable "computer_name" {
  description = "The name of the virtual machine"
  type        = string
  default = "hostname"
}
variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "testadmin"
}
variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  default     = "Password1234!"
}
variable "managed_disk_type" {
  description = "The managed disk type for the virtual machine"
  type        = string
  default     = "Standard_LRS"
}
variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}
