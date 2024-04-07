resource "azurerm_resource_group" "awesome_app" {
  name     = "rg-awesome-app-${var.env}"
  location = "North Europe"
}

resource "azurerm_service_plan" "awesome_app" {
  name                = "plan-awesome-app-${var.env}"
  resource_group_name = azurerm_resource_group.awesome_app.name
  location            = azurerm_resource_group.awesome_app.location
  os_type             = "Linux"
  sku_name            = var.app_sku
}

resource "azurerm_linux_web_app" "awesome_app" {
  name                = "webapp-awesome-app-${var.env}"
  resource_group_name = azurerm_resource_group.awesome_app.name
  location            = azurerm_service_plan.awesome_app.location
  service_plan_id     = azurerm_service_plan.awesome_app.id

  https_only = true

  site_config {
    always_on = false
    application_stack {
      docker_registry_url = "https://index.docker.io"
      docker_image_name = "dergons/demo-app:latest"
    }
  }
}

