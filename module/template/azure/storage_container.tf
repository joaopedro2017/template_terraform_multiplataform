module "storage_container" {
  source               = "../../azure/storage/storage_container"
  count                = length(var.ContainerArmazenamento.NomeContainers) > 0 && length(var.ContainerArmazenamento.ContaArmazenamento) > 0 ? 1 : 0
  storage_account_name = var.ContainerArmazenamento["ContaArmazenamento"]
  container_names      = var.ContainerArmazenamento["NomeContainers"]
  resource_group_name  = var.ContainerArmazenamento["GrupoRecurso"]
  location             = var.ContainerArmazenamento["Regiao"]
}
