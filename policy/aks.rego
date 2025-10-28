package main

deny[msg] {
  input.resource.type == "azurerm_kubernetes_cluster"
  startswith(input.resource.name, "my")
  msg = sprintf("AKS name '%s' is not allowed. It cannot start with 'my'", [input.resource.name])
}
