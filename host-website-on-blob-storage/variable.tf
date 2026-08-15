variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "host-web-blob-project"
 }

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}
variable "storage_account_name" {
  description = "Globally unique Storage Account name"
  type        = string
}
