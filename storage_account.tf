# resource "azurerm_storage_account" "saname" {
#   count                   = length(var.storage_account_name)
#   name                     = var.storage_account_name[count.index]
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_storage_account" "saname" {
  for_each = toset(var.storage_account_name)
  name                     = each.key
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
    tags = merge(var.resource_tags, {
        environment = var.environment
        project     = var.resource_tags["project"]
        owner       = var.resource_tags["owner"]    
    })
  lifecycle {
    create_before_destroy = true
    # ignore_changes = [
    #   tags
    # ]
    # prevent_destroy = true
    }
}
output "sa_information" {
  value = [for i in azurerm_storage_account.saname : i.name]
}