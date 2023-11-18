module "azure_webserver" {
  source = "./module/template/azure"

  AplicativoWebWindows = {
    NomeAplicativos      = []
    NomeInstancia        = "uniacademia-apps"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }
  
}

## Subir dois Azure App Service
