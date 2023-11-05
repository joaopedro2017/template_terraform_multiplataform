module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-mssqlserver-${var.server_name}"
  location            = var.location
  tags = {
    MSSqlServer = var.server_name
    Regiao      = var.location
  }
}

resource "azurerm_mssql_server" "mssql" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location                     = var.location
  version                      = var.dbversion
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
  depends_on                   = [module.resource_group]
}

module "mssql_database" {
  source        = "../mssql_database"
  count         = length(var.mssql_databases)
  database_name = var.mssql_databases[count.index]
  server_id     = azurerm_mssql_server.mssql.id
  collation     = var.collation
  max_size_gb   = var.max_size_gb
  sku_name      = var.sku_name
}

resource "azurerm_mssql_firewall_rule" "example" {
  name             = "azure"
  server_id        = azurerm_mssql_server.mssql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
