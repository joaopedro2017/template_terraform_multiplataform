[ ![back](./img/back.png) ](../README.md)

## Microsoft Azure - WebServer

### App Service

É um serviço da Microsoft Azure que permite aos desenvolvedores criar, hospedar e dimensionar aplicativos da web e móveis de maneira rápida e fácil. Ele oferece uma plataforma de hospedagem gerenciada na nuvem para vários tipos de aplicativos, incluindo aplicativos da web, APIs, aplicativos móveis. O Azure App Service fornece uma plataforma de hospedagem gerenciada que lida com muitos dos aspectos de infraestrutura, como gerenciamento de servidores, escalabilidade, equilíbrio de carga e monitoramento. A seguir temos um exemplo do bloco de variáveis tanto para Windows (AplicativoWebWindows) quanto Linux (AplicativoWebLinux), e após temos os detalhes de cada argumento.


Exemplo de uso:
```csharp
AplicativoWebWindows = {
    NomeAplicativos      = []
    NomeInstancia        = "pangeia"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
}

AplicativoWebLinux = {
    NomeAplicativos      = []
    NomeInstancia        = "creataceo"
    NumeroInstancias     = 1
    TamanhoComputacional = "S1"
    GrupoRecurso         = local.AzureGrupoRecurso
    Regiao               = local.AzureRegiao
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeAplicativos  | Preencha a lista com os nomes dos apps |  - Os nomes deve ter entre 3 a 63 caracteres <br> - Os nomes devem ter apenas letras minúsculas, números e o caratere '-', e não podem começar ou terminar com '-'
NomeInstancia    ||
NumeroInstancias    || - O número de instâncias deve ser entre 1 a 30
TamanhoComputacional||
GrupoRecurso	| O nome do grupo de recursos do Azure onde os recursos serão criados	| - É necessário definir um grupo de recursos para organizar e gerenciar os recursos
Regiao	| A região do Azure onde os Azure Container e Azure Storage serão implantadoss	| - Escolha a região geográfica onde os recursos serão hospedados. Isso pode afetar o desempenho e a disponibilidade.

### Azure Functions