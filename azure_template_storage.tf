module "azure_storage" {
  source = "./module/template/azure"

  ContainerArmazenamento = {
    NomeContainers     = ["container-1", "container-3", "container-2"]
    ContaArmazenamento = "pinguinfenix"
    GrupoRecurso       = local.AzureGrupoRecurso
    Regiao             = local.AzureRegiao
  }
}
