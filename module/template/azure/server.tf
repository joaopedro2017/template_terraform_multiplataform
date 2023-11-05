module "mssql_server" {
  source              = "../../azure/database/mssql_server"
  count               = length(var.ServidorMSSql.NomeBancos) > 0 && length(var.ServidorMSSql.NomeServidor) > 0 ? 1 : 0
  server_name         = var.ServidorMSSql["NomeServidor"]
  mssql_databases     = var.ServidorMSSql["NomeBancos"]
  sku_name            = var.ServidorMSSql["TamanhoComputacional"]
  max_size_gb         = var.ServidorMSSql["TamanhoMaximoGb"]
  collation           = var.ServidorMSSql["Linguagem"]
  dbversion           = var.ServidorMSSql["Versao"]
  resource_group_name = var.ServidorMSSql["GrupoRecurso"]
  location            = var.ServidorMSSql["Regiao"]
  admin_login         = var.ServidorMSSql["UsuarioAdministrador"]
  admin_password      = var.ServidorMSSql["SenhaAdministrador"]
}

module "mariadb_server" {
  source                = "../../azure/database/mariadb_server"
  count                 = length(var.ServidorMariaDB.NomeBancos) > 0 && length(var.ServidorMariaDB.NomeServidor) > 0 ? 1 : 0
  server_name           = var.ServidorMariaDB["NomeServidor"]
  mariadb_databases     = var.ServidorMariaDB["NomeBancos"]
  resource_group_name   = var.ServidorMariaDB["GrupoRecurso"]
  location              = var.ServidorMariaDB["Regiao"]
  sku_name              = var.ServidorMariaDB["TamanhoComputacional"]
  storage_mb            = var.ServidorMariaDB["TamanhoArmazenamentoMb"]
  backup_retention_days = var.ServidorMariaDB["RetencaoBackupDias"]
  admin_login           = var.ServidorMariaDB["UsuarioAdministrador"]
  admin_password        = var.ServidorMariaDB["SenhaAdministrador"]
  dbversion             = var.ServidorMariaDB["Versao"]
  collation             = var.ServidorMariaDB["Linguagem"]
  charset               = var.ServidorMariaDB["ConjuntoCaracteres"]
}

module "mysql_server" {
  source                = "../../azure/database/mysql_server"
  count                 = length(var.ServidorMySQL.NomeBancos) > 0 && length(var.ServidorMySQL.NomeServidor) > 0 ? 1 : 0
  server_name           = var.ServidorMySQL["NomeServidor"]
  mysql_databases       = var.ServidorMySQL["NomeBancos"]
  resource_group_name   = var.ServidorMySQL["GrupoRecurso"]
  location              = var.ServidorMySQL["Regiao"]
  sku_name              = var.ServidorMySQL["TamanhoComputacional"]
  storage_mb            = var.ServidorMySQL["TamanhoArmazenamentoMb"]
  backup_retention_days = var.ServidorMySQL["RetencaoBackupDias"]
  admin_login           = var.ServidorMySQL["UsuarioAdministrador"]
  admin_password        = var.ServidorMySQL["SenhaAdministrador"]
  dbversion             = var.ServidorMySQL["Versao"]
  collation             = var.ServidorMySQL["Linguagem"]
  charset               = var.ServidorMySQL["ConjuntoCaracteres"]
}

module "postgresql_server" {
  source                = "../../azure/database/postgresql_server"
  count                 = length(var.ServidorPostgreSQL.NomeBancos) > 0 && length(var.ServidorPostgreSQL.NomeServidor) > 0 ? 1 : 0
  server_name           = var.ServidorPostgreSQL["NomeServidor"]
  postgresql_databases  = var.ServidorPostgreSQL["NomeBancos"]
  resource_group_name   = var.ServidorPostgreSQL["GrupoRecurso"]
  location              = var.ServidorPostgreSQL["Regiao"]
  sku_name              = var.ServidorPostgreSQL["TamanhoComputacional"]
  storage_mb            = var.ServidorPostgreSQL["TamanhoArmazenamentoMb"]
  backup_retention_days = var.ServidorPostgreSQL["RetencaoBackupDias"]
  admin_login           = var.ServidorPostgreSQL["UsuarioAdministrador"]
  admin_password        = var.ServidorPostgreSQL["SenhaAdministrador"]
  dbversion             = var.ServidorPostgreSQL["Versao"]
  collation             = var.ServidorPostgreSQL["Linguagem"]
  charset               = var.ServidorPostgreSQL["ConjuntoCaracteres"]
}
