module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-postgree-${var.server_name}"
  location            = var.location
  tags = {
    PostGreSQLServer = var.server_name
    Regiao           = var.location
  }
}

resource "azurerm_postgresql_server" "postgresql_server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  version                      = var.dbversion
  ssl_enforcement_enabled      = true
  depends_on                   = [module.resource_group]
}

module "postgresql_database" {
  source              = "../postgresql_database"
  count               = length(var.postgresql_databases)
  database_name       = var.postgresql_databases[count.index]
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_postgresql_firewall_rule" "example" {
  name                = "azure"
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
