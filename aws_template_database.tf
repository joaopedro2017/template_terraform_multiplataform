module "aws_database" {
  source = "./module/template/aws"

  ServicoBancoRelacional = {
    NomeBancos           = ["bancoteste", "banconovo"]
    ArmazenamentoAlocado = 10
    Mecanismo            = "mysql"
    MecanismoVersao      = "5.7"
    TipoInstancia        = "db.t3.micro"
    NomeUsuario          = "foo"
    SenhaUsuario         = "foobarbaz"
    GrupoParametro       = "default.mysql5.7"
    Regiao               = "us-east-2"
  }

  BancoAthena = {
    NomeBancos = [] ## Liste os Bancos com "", "" ....
  }
}