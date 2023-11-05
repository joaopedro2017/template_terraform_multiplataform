module "iam_beanstalk" {
  source   = "../../aws/management/iam_role"
  count    = length(var.ServicoAplicacaoBeanstalk.NomeAplicacoes) > 0 ? 1 : 0
  iam_role = length(var.ServicoAplicacaoBeanstalk.NomeAplicacoes) > 0 ? "beanstalk-service-role" : null
  action   = "sts:AssumeRole"
  service  = "elasticbeanstalk.amazonaws.com"
}
