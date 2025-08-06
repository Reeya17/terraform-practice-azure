terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "3.0.0"
        }
        aws = {
            source  = "hashicorp/aws"
            version = "3.0.0"
        } 
    }
}

provider "aws" {
  alias  = "aws-us-west-2"
  region = "us-west-2"
  
}
provider "aws" {
  alias  = "aws-us-east-1"
  region = "us-east-1"
  
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

