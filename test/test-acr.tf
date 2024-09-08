provider "azurerm" {
  features {}
}

module "test_acr" {
  source              = "../modules/container-registry"
  acr_name            = "testacr"
  resource_group_name = "test-rg"
  location            = "West Europe"
  sku                 = "Standard"
  admin_enabled       = false
  subnet_id           = "your-subnet-id"
  vnet_id             = "your-vnet-id"
  principal_id        = "your-principal-id"
  log_analytics_workspace_id = "your-log-analytics-workspace-id"
}
