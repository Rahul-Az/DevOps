terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}
provider "azurerm" {
  subscription_id            = "8b5a4c25-6973-42af-99a5-926586bdc85d"
  skip_provider_registration = "true"
  features {}
}
variable "prefix" {
  default = "tfvmex"
}
resource "azurerm_virtual_network" "main" {
  name                = "myvnetworknew"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "user-lsinipatjwxa"
}

resource "azurerm_subnet" "internal" {
  count = 2
  name                 = "mysubnet"
  resource_group_name  = "user-lsinipatjwxa"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.${count.index}.0/24"]
}
