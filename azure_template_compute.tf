module "azure_compute" {
  source = "./module/template/azure"

  ## variaveis para provisionar maquinas virtuais windows
  MaquinaVirtualWindows = { ## ate 125 maquinas virtuais 
    NomeMaquinasVirtuais     = []
    ImagemFornecedor         = "MicrosoftWindowsServer"
    ImagemSistemaOperacional = "WindowsServer"
    ImagemDistribuicao       = "2016-Datacenter"
    ImagemVersao             = "latest"
    TamanhoComputacional     = "Standard_B1s"
    UsuarioAdministrador     = "adminuser"
    SenhaAdministrador       = "TTest#123"
    GrupoRecurso             = local.AzureGrupoRecurso
    Regiao                   = local.AzureRegiao
  }

  ## variaveis para provisionar maquinas virtuais linux
  MaquinaVirtualLinux = { ## ate 125 maquinas virtuais 
    NomeMaquinasVirtuais     = []
    ImagemFornecedor         = "Canonical"
    ImagemSistemaOperacional = "UbuntuServer"
    ImagemDistribuicao       = "18.04-LTS"
    ImagemVersao             = "latest"
    TamanhoComputacional     = "Standard_B1s"
    UsuarioAdministrador     = "adminuser"
    SenhaAdministrador       = "TTest#123"
    GrupoRecurso             = local.AzureGrupoRecurso
    Regiao                   = local.AzureRegiao
  }

  ## variaveis para provisionar conjunto de maquinas windows
  ConjuntoEscalarMaquinaVirtualWindows = { ## ate 100 instancias
    NomeConjuntoMaquinaVirtual = ""
    NumeroInstancias           = 5
    ImagemFornecedor           = "MicrosoftWindowsServer"
    ImagemSistemaOperacional   = "WindowsServer"
    ImagemDistribuicao         = "2016-Datacenter-Server-Core"
    ImagemVersao               = "latest"
    TamanhoComputacional       = "Standard_B1s"
    UsuarioAdministrador       = "adminuser"
    SenhaAdministrador         = "P@55w0rd1234!"
    GrupoRecurso               = local.AzureGrupoRecurso
    Regiao                     = local.AzureRegiao
  }

  ## variaveis para provisionar conjunto de maquinas linux
  ConjuntoEscalarMaquinaVirtualLinux = { ## ate 100 instancias
    NomeConjuntoMaquinaVirtual = ""
    NumeroInstancias           = 5
    ImagemFornecedor           = "Canonical"
    ImagemSistemaOperacional   = "UbuntuServer"
    ImagemDistribuicao         = "18.04-LTS"
    ImagemVersao               = "latest"
    TamanhoComputacional       = "Standard_B1s"
    UsuarioAdministrador       = "adminuser"
    SenhaAdministrador         = "P@55w0rd1234!"
    GrupoRecurso               = local.AzureGrupoRecurso
    Regiao                     = local.AzureRegiao
  }
}
