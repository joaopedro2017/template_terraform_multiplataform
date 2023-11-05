module "azure_webserver" {
  source = "./module/template/azure"

  AplicativoWebWindows = {
    NomeAplicativos      = []
    NomeInstancia        = "pangeia"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.GrupoRecurso
    Regiao               = local.Regiao
  }

  AplicativoWebLinux = {
    NomeAplicativos      = []
    NomeInstancia        = "creataceo"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.GrupoRecurso
    Regiao               = local.Regiao
  }

  FunctionWebWindows = {
    NomeFunctions        = []
    NomeInstancia        = "tubeculos"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "batatinhast"
    GrupoRecurso         = local.GrupoRecurso
    Regiao               = local.Regiao
  }

  FunctionWebLinux = {
    NomeFunctions        = []
    NomeInstancia        = "fenix"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "stfunctionlinux"
    GrupoRecurso         = local.GrupoRecurso
    Regiao               = local.Regiao
  }
}
