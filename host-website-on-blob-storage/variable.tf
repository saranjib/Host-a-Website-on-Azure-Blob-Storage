variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "rg-frontdoor-cdn-demo"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}
