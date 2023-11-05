module "elastic_compute_cloud" {
  source                      = "../../aws/compute/elastic_compute_cloud"
  for_each                    = length(var.MaquinaVirtualEC2["NomeInstancias"]) > 0 ? toset(var.MaquinaVirtualEC2["NomeInstancias"]) : []
  instance_name               = each.key
  ami                         = var.MaquinaVirtualEC2["ImagemSistemaOperacional"]
  instance_type               = var.MaquinaVirtualEC2["TipoInstancia"]
  username                    = var.MaquinaVirtualEC2["NomeUsuario"]
  password                    = var.MaquinaVirtualEC2["SenhaUsuario"]
  subnet_id                   = module.subnet_elastic_compute_cloud[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.security_group[0].id]
}

module "security_group" {
  source = "../../aws/networking/security_group"
  count  = length(var.MaquinaVirtualEC2["NomeInstancias"]) > 0 ? 1 : 0
  vpc_id = module.vpc[0].id
}
