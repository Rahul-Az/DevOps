terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
  subscription_id            = "fb326778-1e8f-455c-ac0b-f2e7b5a7c03f"
  skip_provider_registration = true
  features {}
}


data "azurerm_resource_group" "rg" {
  name = "user-bxnnsgstvlia"
}

variable "prefix" {
  default = "tfvmex"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
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
