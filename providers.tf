terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>3.0.0"
        }
    }
    required_version = ">= 1.0.0"
}


#we cannot use the multi-location using provider block as it is not supported 
#in the current version of Terraform in azurerm provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

