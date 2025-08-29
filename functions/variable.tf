variable "project_name" {
    description = "The name of the project"
    type        = string
    default     = "Project_ALPHA_resource"
}
variable "company_tag" {
    type = map(string)
    default = {
           company    = "TechCorp"
           managed_by = "terraform"
   }
}
variable "environment_tags" {
    type = map(string)
    default = {
            environment  = "production"
            cost_center  = "cc-123"
    }
}
variable "storage_account_name" {
    description = "The name of the storage account"
    type        = string
    default     = "Iamthe!StorageAcc1ountwithbigNAME"
}
variable "network_security_group_name" {
    description = "The name of the network security group"
    type        = string
    default     = "${local.formatted_name}-nsg"
}
variable "nsg_port" {
    description = "The port for the network security group"
    type        = string
    default     = "22, 80, 443"
}