module "aws_database" {
  source = "./module/template/aws"

  ServicoBancoRelacional = {
    NomeBancos           = ["uniacademiadb"]
    ArmazenamentoAlocado = 10
    Mecanismo            = "mysql"
    MecanismoVersao      = "5.7"
    TipoInstancia        = "db.t3.micro"
    NomeUsuario          = "foo"
    SenhaUsuario         = "foobarbaz"
    GrupoParametro       = "default.mysql5.7"
    Regiao               = local.AWSRegiao
  }

  BancoAthena = {
    NomeBancos = []
    NomeBucket = ""
  }
}