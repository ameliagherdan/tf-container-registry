module "acr" {
  source              = "./modules/container-registry"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  subnet_id           = var.subnet_id
  vnet_id             = var.vnet_id
  principal_id        = var.principal_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
}