module "azure_webserver" {
  source = "./module/template/azure"

  AplicativoWebWindows = {
    NomeAplicativos      = ["uniacademia-biblioteca", "uniacademia-labs"]
    NomeInstancia        = "uniacademia-apps"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }
  
}

## Subir dois Azure App Service
