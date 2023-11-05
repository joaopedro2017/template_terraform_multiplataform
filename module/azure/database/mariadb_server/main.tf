module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-mariadb-${var.server_name}"
  location            = var.location
  tags = {
    MariaDBServer = var.server_name
    Regiao        = var.location
  }
}

resource "azurerm_mariadb_server" "maria_server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  version                      = var.dbversion
  ssl_enforcement_enabled      = true
}

module "mariadb_database" {
  source              = "../mariadb_database"
  count               = length(var.mariadb_databases)
  maria_database      = var.mariadb_databases[count.index]
  server_name         = azurerm_mariadb_server.maria_server.name
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_mariadb_firewall_rule" "example" {
  name                = "azure"
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  server_name         = var.server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
