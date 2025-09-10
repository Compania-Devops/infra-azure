terraform {
  backend "azurerm" {
    resource_group_name  = "rg-cicd-terraform-app-baraujo" # Reemplazar por apellido
    storage_account_name = "tfstatebaraujo"                # Reemplazar por apellido
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}