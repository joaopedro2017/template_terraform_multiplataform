module "athena_db" {
  source    = "../../aws/database/athena_database"
  for_each  = length(var.BancoAthena.NomeBancos) > 0 ? toset(var.BancoAthena.NomeBancos) : []
  db_name   = each.key
  bucket_id = module.simple_storage_service_athena[0].id
}
