data "azurerm_resource_group" "principal" {
  name = "rg-cicd-terraform-app-${local.idapp}"
}
resource "azurerm_resource_group" "main" {
  name     = "rg-cicd-terraform-app-${local.idapp}-${var.environment}"
  location = var.region
}

data "azurerm_container_registry" "acr" {
  name                = "acr${local.idapp}"
  resource_group_name = data.azurerm_resource_group.principal.name
}

resource "azurerm_container_app_environment" "aca_env" {
  name                = "aca-env-${local.idapp}-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_container_app" "aca" {
  name                         = "aca-ms-${local.idapp}-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = azurerm_resource_group.main.name
  revision_mode                = "Single"

  template {
    container {
      name   = "demo"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  ingress {
    external_enabled           = true
    target_port                = 80
    allow_insecure_connections = false

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }

  }

  lifecycle {
    ignore_changes = [
      template[0].container[0].image,
      registry
    ]
  }
  depends_on = [ azurerm_container_app_environment.aca_env ]
}



