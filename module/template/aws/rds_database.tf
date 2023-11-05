module "rds_database" {
  source               = "../../aws/database/rds_database"
  for_each             = length(var.ServicoBancoRelacional.NomeBancos) > 0 ? toset(var.ServicoBancoRelacional.NomeBancos) : []
  db_name              = each.key
  allocated_storage    = var.ServicoBancoRelacional["ArmazenamentoAlocado"]
  db_username          = var.ServicoBancoRelacional["NomeUsuario"]
  db_password          = var.ServicoBancoRelacional["SenhaUsuario"]
  engine               = var.ServicoBancoRelacional["Mecanismo"]
  engine_version       = var.ServicoBancoRelacional["MecanismoVersao"]
  parameter_group_name = var.ServicoBancoRelacional["GrupoParametro"]
  instance_class       = var.ServicoBancoRelacional["TipoInstancia"]
  db_subnet_group_name = module.db_subnet_group[0].name
  project              = var.aws_authentication["project"]
  environment          = var.aws_authentication["environment"]
}
