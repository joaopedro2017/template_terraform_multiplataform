module "azure_storage" {
  source = "./module/template/azure"

  ContainerArmazenamento = {
    NomeContainers     = []
    ContaArmazenamento = "uniacademiatest"
    GrupoRecurso       = local.AzureGrupoRecurso
    Regiao             = local.AzureRegiao
  }
}
