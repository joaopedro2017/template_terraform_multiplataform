[ ![back](./img/back.png) ](../README.md)

## Microsoft Azure - Compute

### Máquina Virtual

A criação e gerenciamento de máquinas virtuais (VMs) no Azure, incluindo ambientes Linux e Windows. Ele inclui orientações para criar VMs, configurar conectividade e segurança, gerenciar recursos, otimizar o desempenho e integrar serviços adicionais do Azure. O objetivo é capacitar os usuários a aproveitar ao máximo as VMs na plataforma de nuvem Azure, independentemente do sistema operacional. Abaixo segue o modelo do bloco de variáveis do Windows e Lixux e na sequência a tabela com informações sobre os atributos.

```csharp
## Exemplo para Maquina Virtual Windows
MaquinaVirtualWindows = {
    NomeMaquinasVirtuais     = ["vm1"]
    ImagemFornecedor         = "MicrosoftWindowsServer"
    ImagemSistemaOperacional = "WindowsServer"
    ImagemDistribuicao       = "2016-Datacenter"
    ImagemVersao             = "latest"
    TamanhoComputacional     = "Standard_B1s"
    UsuarioAdministrador     = "<usuario>"
    SenhaAdministrador       = "<senha>"
    GrupoRecurso             = local.GrupoRecurso
    Regiao                   = local.Regiao
  }

## Exemplo para Maquina Virtual Linux
  MaquinaVirtualLinux = { 
    NomeMaquinasVirtuais     = ["vm1"]
    ImagemFornecedor         = "Canonical"
    ImagemSistemaOperacional = "UbuntuServer"
    ImagemDistribuicao       = "18.04-LTS"
    ImagemVersao             = "latest"
    TamanhoComputacional     = "Standard_B1s"
    UsuarioAdministrador     = "<usuario>"
    SenhaAdministrador       = "<senha>"
    GrupoRecurso             = local.GrupoRecurso
    Regiao                   = local.Regiao
  }
```


Atributos	| Especificações	| Restrições
-----------| ------------| ----------------------
NomeMaquinasVirtuais	| Forneça uma lista de nomes para suas máquinas virtuais	| - A lista deve conter até 125 nomes, com cada nome contendo no máximo 64 caracteres.<br> - Os nomes não podem se repetir. <br> - Caso a lista esteja vazia não sera provisionado
ImagemFornecedor	| O fornecedor da imagem da máquina virtual| 	- No Azure, as imagens da Canonical são comuns para sistemas Linux, enquanto "MicrosoftWindowsServer" é usado para sistemas Windows.
ImagemSistemaOperacional| 	O sistema operacional da imagem da máquina virtual	| - Pode ser "UbuntuServer" para sistemas Linux ou "WindowsServer" para sistemas Windows.
ImagemDistribuicao	| A distribuição específica do sistema operacional	| - Para sistemas Linux, é comum usar "18.04-LTS", enquanto para sistemas Windows, "2016-Datacenter" é uma opção.
ImagemVersao	| A versão da imagem a ser utilizada	| - "latest" representa a versão mais recente disponível da imagem.
TamanhoComputacional| 	O tamanho da VM	| - "Standard_B1s" é um tamanho básico de VM que pode ser ajustado conforme a necessidade. <br> - Consulte outros valores em [Tamanhos das máquinas virtuais no Azure](https://learn.microsoft.com/pt-br/azure/virtual-machines/sizes)
UsuarioAdministrador	| O nome de usuário do administrador para fazer login na VM	| - É importante definir um nome de usuário que será usado para acessar a máquina virtual.
SenhaAdministrador	| A senha do administrador para fazer login na VM	| - Certifique-se de que a senha seja forte e segura para garantir a segurança da VM.
GrupoRecurso	| O nome do grupo de recursos do Azure onde a VM será criada	| - É necessário definir um grupo de recursos para organizar e gerenciar os recursos relacionados à VM.
Regiao	| A região do Azure onde a VM será implantada	| - Escolha a região geográfica onde a VM será hospedada. Isso pode afetar o desempenho e a disponibilidade.


### Conjunto de Dimensionamento de Máquinas Virtuais

É um serviço de dimensionamento automático e gerenciamento de máquinas virtuais (VMs) no Microsoft Azure. Este recurso permite criar grupos de VMs idênticas para oferecer alta disponibilidade, escalabilidade e gerenciamento eficiente de aplicativos na nuvem. 

Na tabela a seguir, serão apresentados os argumentos para os recursos de <b>Conjuntos de Dimensionamento de Máquinas Virtuais</b>, aplicáveis tanto a sistemas Linux quanto a sistemas Windows. Alguns dos argumentos, como ImagemFornecedor, ImagemSistemaOperacional, ImagemDistribuicao, ImagemVersao, TamanhoComputacional, UsuarioAdministrador, SenhaAdministrador, GrupoRecurso e Regiao, já foram mencionados anteriormente. Portanto, focaremos nos argumentos restantes:

```csharp
## variaveis para provisionar conjunto de maquinas windows
  ConjuntoEscalarMaquinaVirtualWindows = {
    NomeConjuntoMaquinaVirtual = "conjunto-vmss-test"
    NumeroInstancias           = 5
    ImagemFornecedor           = "MicrosoftWindowsServer"
    ImagemSistemaOperacional   = "WindowsServer"
    ImagemDistribuicao         = "2016-Datacenter-Server-Core"
    ImagemVersao               = "latest"
    TamanhoComputacional       = "Standard_B1s"
    UsuarioAdministrador       = "<usuario>"
    SenhaAdministrador         = "<senha>"
    GrupoRecurso               = local.GrupoRecurso
    Regiao                     = local.Regiao
  }

  ## variaveis para provisionar conjunto de maquinas linux
  ConjuntoEscalarMaquinaVirtualLinux = {
    NomeConjuntoMaquinaVirtual = "conjunto-vmss-test"
    NumeroInstancias           = 5
    ImagemFornecedor           = "Canonical"
    ImagemSistemaOperacional   = "UbuntuServer"
    ImagemDistribuicao         = "18.04-LTS"
    ImagemVersao               = "latest"
    TamanhoComputacional       = "Standard_B1s"
    UsuarioAdministrador       = "<usuario>"
    SenhaAdministrador         = "<senha>"
    GrupoRecurso               = local.GrupoRecurso
    Regiao                     = local.Regiao
  }
}
```

Atributos	| Especificações	| Restrições
-----------| ------------| ----------------------
NomeConjuntoMaquinaVirtual | Nome para o conjunto de Dimensionamento | Deve conter até 64 caracteres
NumeroInstancias | Números de instancias a serem provisionadas | Limite máximo neste template é de até 100 máquinas virtuais