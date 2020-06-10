provider "azurerm" {
  version = "=1.35.0"
}

resource "azurerm_resource_group" "test03" {
  name     = "autoscaling-terraform"
  location = var.location
}
