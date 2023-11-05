module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-mysql-${var.server_name}"
  location            = var.location
  tags = {
    MySqlServer = var.server_name
    Regiao      = var.location
  }
}

resource "azurerm_mysql_server" "mysql_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.dbversion

  auto_grow_enabled                 = true
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

module "mysql_database" {
  source              = "../mysql_database"
  count               = length(var.mysql_databases)
  database_name       = var.mysql_databases[count.index]
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  collation           = var.collation
  charset             = var.charset
}

resource "azurerm_mysql_firewall_rule" "example" {
  name                = "office"
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
