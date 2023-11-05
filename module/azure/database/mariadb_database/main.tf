resource "azurerm_mariadb_database" "mariadb" {
  name                = var.maria_database
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = var.charset
  collation           = var.collation
}
