resource "azurerm_resource_group" "awesome_app" {
  name     = "rg-awesome-app-${var.env}"
  location = "North Europe"
}
