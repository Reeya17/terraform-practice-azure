terraform {
    backend "azurerm" {
    use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
    tenant_id            = "8cc5a7e3-decc-4961-95fe-4d5909701fb7"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    subscription_id      = "9759a8fa-f37e-45f2-8cc9-a8b3dd1977b0"  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable. Azure CLI will fallback to use the connected subscription ID if not supplied.
    resource_group_name  = "rg-tfstate"                           # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "satfstate601725"                       # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  
}
}