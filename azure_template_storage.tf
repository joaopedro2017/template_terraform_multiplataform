module "azure_storage" {
  source = "./module/template/azure"

  ContainerArmazenamento = {
    NomeContainers     = []
    ContaArmazenamento = "pinguinfenix"
    GrupoRecurso       = local.AzureGrupoRecurso
    Regiao             = local.AzureRegiao
  }
}
