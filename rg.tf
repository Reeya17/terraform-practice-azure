
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location 
  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
    # precondition {
    #     condition = contains(var.allowed_locations, var.location)
    #     error_message = "The location ${var.location} is not allowed for this resource."
    # }
  }
  tags = {
    environment = var.environment
    project     = var.resource_tags["project"]
    owner       = var.resource_tags["owner"]
  }
}