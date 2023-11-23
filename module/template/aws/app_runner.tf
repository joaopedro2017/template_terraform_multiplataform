module "app_runner" {
  source                = "../../aws/webserver/app_runner"
  for_each              = length(var.AplicacaoContainer.NomeAplicacoes) > 0 ? toset(var.AplicacaoContainer["NomeAplicacoes"]) : []
  service_name          = each.key
  image_identifier      = var.AplicacaoContainer["ImagemContainer"]
  port                  = var.AplicacaoContainer["Porta"]
  image_repository_type = var.AplicacaoContainer["TipoRepositorio"]
}
