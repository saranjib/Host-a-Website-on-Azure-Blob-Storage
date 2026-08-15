output "resource_group_name" {
  value = azurerm_resource_group.host-web-blob-project.name
}

output "storage_account_name" {
  value = azurerm_storage_account.website-storage.name
}

output "static_website_url" {
  value = azurerm_storage_account.website-storage.primary_web_endpoint
}

