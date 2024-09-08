output "acr_id" {
  description = "The ID of the Azure Container Registry"
  value       = module.acr.acr_id
}

output "acr_login_server" {
  description = "The login server URL for the Azure Container Registry"
  value       = module.acr.acr_login_server
}
