module "beanstalk_application" {
  source           = "../../aws/compute/beanstalk_application"
  for_each         = length(var.ServicoAplicacaoBeanstalk.NomeAplicacoes) > 0 ? toset(var.ServicoAplicacaoBeanstalk["NomeAplicacoes"]) : []
  application_name = each.key
  service_role_arn = module.iam_beanstalk[0].arn
}
