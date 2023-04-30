data "azurerm_storage_account" "existing_storage_account" {
  count               = var.existing_storage_account_name != "" ? 1 : 0
  name                = var.existing_storage_account_name
  resource_group_name = var.existing_storage_account_rg
}
