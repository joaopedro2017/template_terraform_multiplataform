module "autoscaling_group" {
  source        = "../../aws/compute/autoscaling_group"
  count         = length(var.GrupoAutoScalarEC2["NomeGrupo"]) > 0 ? 1 : 0
  name_prefix   = var.GrupoAutoScalarEC2["NomeGrupo"]
  ami           = var.GrupoAutoScalarEC2["ImagemSistemaOperacional"]
  instance_type = var.GrupoAutoScalarEC2["TipoInstancia"]
  max_size      = var.GrupoAutoScalarEC2["MaximoInstancia"]
  min_size      = var.GrupoAutoScalarEC2["MinimoInstancia"]
  subnet_id     = [module.subnet_autoscaling_group[0].id]
}
