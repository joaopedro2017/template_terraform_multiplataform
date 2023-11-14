module "azure_storage" {
  source = "./module/template/azure"

  ContainerArmazenamento = {
    NomeContainers     = ["container-1", "container-2"]
    ContaArmazenamento = "uniacademiatest"
    GrupoRecurso       = local.AzureGrupoRecurso
    Regiao             = local.AzureRegiao
  }
}
