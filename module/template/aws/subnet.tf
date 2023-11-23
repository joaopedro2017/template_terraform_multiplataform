module "subnet_elastic_compute_cloud" {
  source            = "../../aws/networking/subnet"
  count             = length(var.MaquinaVirtualEC2["NomeInstancias"]) > 0 ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.10.0/24"
  subnet_name       = "ec2"
  availability_zone = "${var.GrupoAutoScalarEC2["Regiao"]}a"
}

module "subnet_autoscaling_group" {
  source            = "../../aws/networking/subnet"
  count             = length(var.GrupoAutoScalarEC2["NomeGrupo"]) > 0 ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.11.0/24"
  subnet_name       = "ag"
  availability_zone = "${var.GrupoAutoScalarEC2["Regiao"]}a"
}

module "subnet_rds_database_a" {
  source            = "../../aws/networking/subnet"
  count             = length(var.ServicoBancoRelacional.NomeBancos) > 0 ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.12.0/24"
  subnet_name       = "rds-a"
  availability_zone = "${var.ServicoBancoRelacional["Regiao"]}b"
}

module "subnet_rds_database_b" {
  source            = "../../aws/networking/subnet"
  count             = length(var.ServicoBancoRelacional.NomeBancos) > 0 ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.13.0/24"
  subnet_name       = "rds-b"
  availability_zone = "${var.ServicoBancoRelacional["Regiao"]}c"
}
