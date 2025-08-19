resource "azurerm_network_security_group" "example" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  dynamic "security_rule" {
    for_each = local.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
  }
 

}
 tags = {
    environment = local.common_tags.environment
    lob         = local.common_tags.lob
    project     = local.common_tags.project
  }
  lifecycle {
    ignore_changes = [security_rule]
  }
}
resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.example.id
  depends_on = [azurerm_network_interface.main, azurerm_network_security_group.example]
}
resource "azurerm_subnet_network_security_group_association" "name" {
  subnet_id               = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.example.id
}