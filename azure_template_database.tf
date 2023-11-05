module "azure_database" {
  source = "./module/template/azure"

  ServidorPostgreSQL = {
    NomeBancos             = []
    NomeServidor           = "pinguim-fenix"
    Linguagem              = "English_United States.1252"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "11"
    TamanhoComputacional   = "B_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 5120
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.GrupoRecurso
    Regiao                 = local.Regiao
  }

  ServidorMySQL = {
    NomeBancos             = []
    NomeServidor           = "mysql-joao"
    Linguagem              = "utf8_unicode_ci"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "8.0"
    TamanhoComputacional   = "GP_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 5120
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.GrupoRecurso
    Regiao                 = local.Regiao
  }

  ServidorMariaDB = {
    NomeBancos             = []
    NomeServidor           = "servidor-mariadb-joao"
    Linguagem              = "utf8_unicode_ci"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "10.2"
    TamanhoComputacional   = "B_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 51200
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.GrupoRecurso
    Regiao                 = local.Regiao
  }

  ServidorMSSql = {
    NomeBancos           = []
    NomeServidor         = "servidor-pessoal-mssql"
    UsuarioAdministrador = "4dm1n157r470r"
    SenhaAdministrador   = "4-v3ry-53cr37-p455w0rd"
    TamanhoMaximoGb      = 4
    Linguagem            = "SQL_Latin1_General_CP1_CI_AS"
    Versao               = "12.0"
    TamanhoComputacional = "S0"
    GrupoRecurso         = local.GrupoRecurso
    Regiao               = local.Regiao
  }
}
