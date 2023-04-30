variable "name" {
  description = "Name of the Function App."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create the Function App in."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resource"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Location to create the App Service Plan in, if different from the resource group location (Optional)."
  type        = string
  default     = ""
}

variable "existing_app_service_plan_id" {
  description = "Application Service Plan ID."
  type        = string
  default     = ""
}

variable "app_service_plan_sku" {
  type        = string
  description = "App Service Plan SKU."
  default     = "Y1"
}

variable "os_type" {
  type        = string
  description = "App Service Plan OS Type."
  default     = "Linux"
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan Name."
}

variable "system_assigned_managed_identity" {
  description = "Do we generate a system assigned managed identity for this function app? (Optional)"
  type        = bool
  default     = false
}

variable "user_assigned_managed_ids" {
  description = "Specifies a list of user managed identity ids to be assigned (Optional)"
  type        = list(string)
  default     = []
}

variable "existing_storage_account_name" {
  type        = string
  description = "existing storage account name"
  default     = ""
}

variable "existing_storage_account_rg" {
  type        = string
  description = "existing storage account resource group"
  default     = ""
}

variable "new_storage_account_name" {
  type        = string
  description = "new storage account name"
  default     = ""
}

variable "new_storage_account_tier" {
  type        = string
  description = "new storage account tier"
  default     = "Standard"
}

variable "new_storage_account_replication_type" {
  type        = string
  description = "new storage account replication type"
  default     = "LRS"
}

variable "node_version" {
  type    = number
  default = 16
}

variable "min_tls_version" {
  type        = string
  description = "minimum TLS version"
  default     = "1.2"
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values. (Optional)"
  type        = map(any)
  default     = {}
}
