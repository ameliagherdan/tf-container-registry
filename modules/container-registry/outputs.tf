output "acr_id" {
  description = "The ID of the Azure Container Registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "The login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_private_endpoint_id" {
  description = "The ID of the private endpoint associated with the ACR"
  value       = azurerm_private_endpoint.acr_private_endpoint.id
}

output "acr_private_dns_zone_id" {
  description = "The ID of the private DNS zone"
  value       = azurerm_private_dns_zone.acr_private_dns.id
}
