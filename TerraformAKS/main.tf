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
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks1"

  default_node_pool {
    name       = "agentpool"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  }
