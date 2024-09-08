# Azure Container Registry Terraform Module

This Terraform module creates a secure, highly available Azure Container Registry (ACR) with key management and logging. It also integrates with Azure Key Vault for encryption keys and implements best security practices, such as private endpoints, network rules, and advanced threat protection.

## Features

- Creates an Azure Container Registry with a private endpoint.
- Integrates with Azure Key Vault to manage encryption keys for ACR.
- Enables network security through IP restrictions and virtual network subnet rules.
- Configures Azure Advanced Threat Protection and Azure Defender for ACR.
- Provides options for diagnostics and monitoring via Azure Monitor.

## Usage

This example shows how to use the module in a test environment:

```hcl
provider "azurerm" {
  features {}
}

resource "random_id" "acr_suffix" {
  byte_length = 2
}

module "test_container_registry" {
  source                    = "../modules/container-registry"
  resource_group_name        = "test-rg"
  location                   = "West Europe"
  acr_name                   = "testcontainerregistry-${random_id.acr_suffix.hex}"
  allowed_subnet_ids         = []
  allowed_ip_ranges          = ["10.0.0.0/24"]
  private_endpoint_subnet_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx/subnets/xxx"
  environment                = "development"
  log_analytics_workspace_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.OperationalInsights/workspaces/xxx"
}
```

## Variables

| Name                        | Description                                                      | Type           | Default      |
|-----------------------------|------------------------------------------------------------------|----------------|--------------|
| `resource_group_name`        | Name of the resource group where the ACR will be created         | `string`       | n/a          |
| `location`                   | Location/region where the ACR will be created                    | `string`       | `West Europe`|
| `acr_name`                   | Globally unique name for the container registry                  | `string`       | n/a          |
| `allowed_ip_ranges`          | List of IP ranges that can access the ACR (in CIDR notation)     | `list(string)` | `[]`         |
| `allowed_subnet_ids`         | List of subnet IDs allowed to access the ACR                     | `list(string)` | `[]`         |
| `private_endpoint_subnet_id` | Subnet ID where the private endpoint will be created             | `string`       | n/a          |
| `environment`                | The environment where the resources will be deployed (e.g., dev, prod) | `string`  | `production` |
| `log_analytics_workspace_id` | Log Analytics Workspace ID for logging                           | `string`       | n/a          |

## Outputs

| Name                       | Description                                                        |
|----------------------------|--------------------------------------------------------------------|
| `acr_id`                    | The ID of the created container registry                           |
| `private_endpoint_ip`       | The private IP address of the private endpoint                     |
| `key_vault_id`              | The ID of the Key Vault used for managing the ACR keys             |
| `customer_managed_key_id`   | The ID of the customer-managed key                                 |
