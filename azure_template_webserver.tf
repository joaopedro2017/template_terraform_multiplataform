module "azure_webserver" {
  source = "./module/template/azure"

  AplicativoWebWindows = {
    NomeAplicativos      = ["uniacademia-biblioteca-api"]
    NomeInstancia        = "uniacademia-apps"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }

  AplicativoWebLinux = {
    NomeAplicativos      = []
    NomeInstancia        = "creataceo"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }

  FunctionWebWindows = {
    NomeFunctions        = []
    NomeInstancia        = "tubeculos"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "batatinhast"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }

  FunctionWebLinux = {
    NomeFunctions        = []
    NomeInstancia        = "fenix"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "stfunctionlinux"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
  }
}
