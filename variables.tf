variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location for the resources"
  type        = string
  default     = "West Europe"
}

variable "sku" {
  description = "The SKU of the Azure Container Registry. Options are Basic, Standard, Premium."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Enable the admin user for Azure Container Registry"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "The subnet ID where the private endpoint will be created"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network for the private DNS zone"
  type        = string
}

variable "principal_id" {
  description = "The principal ID to assign the AcrPull role"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics"
  type        = string
}
