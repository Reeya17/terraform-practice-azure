locals {
  formatted_name = lower(replace(var.project_name, "_", "-"))
  merged_tags    = merge(var.company_tag, var.environment_tags)
  formatted_name_sa_part1 = replace(lower(var.storage_account_name), "!", "")
  formatted_name_sa_part2 = substr(local.formatted_name_sa_part1, 0, 23)
  formatted_ports       = split(", ", var.nsg_port)
}
resource "azurerm_resource_group" "rg" {
    name     = "${local.formatted_name}-rg"
    location = "East US"
    #tags     = merge(var.company_tag, var.environment_tags)
    tags = local.merged_tags
}
resource "azurerm_storage_account" "storage" {
    name                     = local.formatted_name_sa_part2
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags                     = local.merged_tags
}
resource "azurerm_network_security_group" "nsg" {
    name                = "${local.formatted_name}-nsg"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "Allow-SSH"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix     = "*"
        destination_address_prefix = "*"
    }

    tags = local.merged_tags
}