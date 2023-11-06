module "simple_storage_service" {
  source      = "../../aws/storage/simple_storage_service"
  for_each    = length(var.ArmazenamentoS3.NomeBuckets) > 0 ? toset(var.ArmazenamentoS3["NomeBuckets"]) : []
  bucket_name = each.key
}

module "simple_storage_service_athena" {
  source      = "../../aws/storage/simple_storage_service"
  count       = length(var.BancoAthena.NomeBancos) > 0 ? 1 : 0
  bucket_name = var.BancoAthena.NomeBucket
}
