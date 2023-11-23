module "aws_webserver" {
  source = "./module/template/aws"

  ServicoAplicacaoBeanstalk = {
    NomeAplicacoes = []
  }

  AplicacaoContainer = {
    NomeAplicacoes  = []
    ImagemContainer = "public.ecr.aws/aws-containers/hello-app-runner:latest"
    Porta           = "8000"
    TipoRepositorio = "ECR_PUBLIC"
  }
}
