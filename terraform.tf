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
  subscription_id = "b497fd69-266c-46a9-b55b-8be0cd579667" # Id de suscripción DMC
  # subscription_id = "f2a08fd0-079c-4dab-a431-df74b86366ab" # Id de suscripción Personal
}