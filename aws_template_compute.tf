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



# module "aws" {
#   source = "./module/template/aws"

#   # Obrigatorio  Athentication
#   aws_authentication = {
#     project     = "uniacademia"
#     environment = "develop"
#     access_key  = "access_key"
#     secret_key  = "secret_key"
#     region      = "us-east-2"
#   }

#   ## imagens publicas do ecr 
#   ## https://gallery.ecr.aws
#   app_runner = {
#     create           = false
#     service_names    = ["RUNNER-2023-"]
#     image_identifier = "public.ecr.aws/aws-containers/hello-app-runner:latest"
#     port             = "8000"
#   }
# }



