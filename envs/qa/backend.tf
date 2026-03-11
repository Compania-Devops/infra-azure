terraform {
  backend "azurerm" {
    resource_group_name  = "rg-cicd-terraform-app-baraujo02" # Reemplazar por apellido
    storage_account_name = "tfstatebaraujo02"                # Reemplazar por apellido
    container_name       = "tfstate"
    key                  = "qa/terraform.tfstate"
  }
}