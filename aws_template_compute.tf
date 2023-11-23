module "aws_compute" {
  source = "./module/template/aws"

  ServicoAplicacaoBeanstalk = {
    NomeAplicacoes = []
  }

  MaquinaVirtualEC2 = {
    NomeInstancias           = []
    ImagemSistemaOperacional = "ami-05d8140b845a8aa7b"
    TipoInstancia            = "t2.micro"
    NomeUsuario              = "foo"
    SenhaUsuario             = "foobarbaz"
    Regiao                   = local.AWSRegiao
  }

  GrupoAutoScalarEC2 = {
    NomeGrupo                = ""
    ImagemSistemaOperacional = "ami-05d8140b845a8aa7b"
    TipoInstancia            = "t2.micro"
    MinimoInstancia          = 0
    MaximoInstancia          = 32
    Regiao                   = local.AWSRegiao
  }
}
