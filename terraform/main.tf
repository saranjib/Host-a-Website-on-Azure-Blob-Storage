resource "azurerm_resource_group" "host-web-blob-project" {
  name     = var.resource_group_name
  location = var.location

}


# ---------------------------------------------------------
# Azure Storage Account
# ---------------------------------------------------------

resource "azurerm_storage_account" "website-storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.host-web-blob-project.name
  location                 = azurerm_resource_group.host-web-blob-project.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version = "TLS1_2"

  static_website {
    index_document = "index.html"
    error_404_document = "index.html"
  }

}


# ---------------------------------------------------------
# Website HTML
# ---------------------------------------------------------

resource "azurerm_storage_blob" "website-blob-index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.website-storage.name
  storage_container_name = "$web"

  type         = "Block"
  source       = "${path.module}/website/index.html"
  content_type = "text/html"
}

# ---------------------------------------------------------
# Enable Static Website Hosting
# ---------------------------------------------------------

resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id = azurerm_storage_account.website-storage.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

