resource "azurerm_resource_group" "awesome_app" {
  name     = "rg-awesome-app-dev"
  location = "North Europe"
}

resource "azurerm_service_plan" "awesome_app" {
  name                = "plan-awesome-app-dev"
  resource_group_name = azurerm_resource_group.awesome_app.name
  location            = azurerm_resource_group.awesome_app.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "awesome_app" {
  name                = "webapp-awesome-app-dev"
  resource_group_name = azurerm_resource_group.awesome_app.name
  location            = azurerm_service_plan.awesome_app.location
  service_plan_id     = azurerm_service_plan.awesome_app.id

  https_only = false

  site_config {
    always_on = false
    application_stack {
      docker_registry_url = "https://index.docker.io"
      docker_image_name = "dergons/demo-app:latest"
    }
  }
}

