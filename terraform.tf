locals {
  idapp = "baraujo01" # baraujo01
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "3d4bb8be-b12c-4c52-8cec-1b81cb8fb1a0" # Id de suscripción DMC
  subscription_id = "f2a08fd0-079c-4dab-a431-df74b86366ab" # Id de suscripción Personal
}