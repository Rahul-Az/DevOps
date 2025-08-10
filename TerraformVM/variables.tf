variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "3de62206-74cd-4137-8183-b0877f1cb48b"
}

variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group"
  type        = string
  default     = "user-tpeigyakomqk"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "tfvm"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "myuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
  default     = "password@123"
}

variable "vm_size" {
  description = "Size of the Azure VM"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "os_image" {
  description = "OS image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
