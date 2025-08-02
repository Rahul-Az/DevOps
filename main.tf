terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}
provider "azurerm" {
  subscription_id            = "6fd120c3-642e-4042-a7ee-3d043b8aba4d"
  skip_provider_registration = "true"
  features {}
}
variable "prefix" {
  default = "tfvmex"
}
resource "azurerm_virtual_network" "main" {
  name                = "myvnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "user-bvdmwqduboyk"
}

resource "azurerm_subnet" "internal" {
  count = 2
  name                 = "mysubnet"
  resource_group_name  = "user-bvdmwqduboyk"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.${count.index}.0/24"]
}
