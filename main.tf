resource "azurerm_storage_account" "this" {
  count                    = var.existing_storage_account_name != "" ? 0 : 1
  name                     = var.new_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.new_storage_account_tier
  account_replication_type = var.new_storage_account_replication_type
}

resource "azurerm_service_plan" "this" {
  count               = var.existing_app_service_plan_id != "" ? 0 : 1
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.app_service_plan_sku
}

resource "azurerm_linux_function_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.existing_storage_account_name == "" ? azurerm_storage_account.this[0].name : var.existing_storage_account_name
  storage_account_access_key = var.existing_storage_account_name == "" ? azurerm_storage_account.this[0].primary_access_key : data.azurerm_storage_account.existing_storage_account[0].primary_access_key
  service_plan_id            = var.existing_app_service_plan_id != "" ? var.existing_app_service_plan_id : azurerm_service_plan.this[0].id

  app_settings = var.app_settings

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned" ? [1] : []
    content {
      type = local.identity_type
    }
  }

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned, UserAssigned" || local.identity_type == "UserAssigned" ? [1] : []
    content {
      type         = local.identity_type
      identity_ids = var.user_assigned_managed_ids
    }
  }
  site_config {
    application_stack {
      node_version = var.node_version
    }
    minimum_tls_version = var.min_tls_version
  }
}
