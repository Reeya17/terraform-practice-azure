variable "num" {
  description = "version number for the resource"
  type        = number
  default     = 1 
}
# Map is for key pairs values.
variable "resource_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    version     = "1.0"
    owner       = "admin"
  }
  
}
# Tuple is for fixed size and ordered collection of values and different datatypes.
variable "network_configuration" {
  description = "Network configuration for the virtual machine-Vnet, Subnet, CIDR"
  type        = tuple([ string,string, number ])
  default     = ["10.0.0.0/16", "10.0.2.0", 24]
}
# list is for ordered collection of values and same datatype.
variable "sku" {
  type = list(string)
  default = ["Standard", "Premium", "Basic"]
}
variable "os_profile_linux_config" {
  type = bool
  description = "Configuration for Linux OS profile"
  default = false
}
# Object is for complex data structure with values and different datatypes.
variable "storage_image_reference" {
  description = "Configuration for the virtual machine"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "prefix" {
  default = "tfvmex"
}
variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "staging"
}
variable "allowed_locations" {
  description = "List of allowed Azure locations for resource deployment"
  type        = list(string)
  default     = ["westeurope", "northeurope", "uksouth"]  
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
