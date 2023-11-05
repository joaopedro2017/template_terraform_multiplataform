## arrumar
# module "resource_group" {
#   source              = "../../azure/management/resource_group"
#   count               = var.ContainerArmazenamento.GrupoRecurso == "" ? 1 : 0
#   resource_group_name = "grupo-recurso-terraform-storage-${var.ContainerArmazenamento.ContaArmazenamento}"
#   location            = var.ContainerArmazenamento["location"]
#   tags = {
#     Storage = var.ContainerArmazenamento["ContaArmazenamento"]
#     Regiao  = var.ContainerArmazenamento["Regiao"]
#   }
# }








