locals {
  # managed identity
  identity_type_map = { # helper map for identity_type
    "SystemAssigned" = var.system_assigned_managed_identity
    "UserAssigned"   = length(var.user_assigned_managed_ids) > 0
  }

  # generate identity_type string as per documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app#type
  identity_type = join(", ", matchkeys(keys(local.identity_type_map), values(local.identity_type_map), [true]))

}
