module "azure_compute" {
  source = "./module/template/azure"

  MaquinaVirtualWindows = {
    NomeMaquinasVirtuais     = ["UniAcademia-Test"]
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

  MaquinaVirtualLinux = {
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

  ConjuntoEscalarMaquinaVirtualWindows = {
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

  ConjuntoEscalarMaquinaVirtualLinux = {
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
