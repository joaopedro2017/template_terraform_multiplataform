[ ![back](./img/back.png) ](../README.md)

## Microsoft Azure - WebServer

### App Service

É um serviço da Microsoft Azure que permite aos desenvolvedores criar, hospedar e dimensionar aplicativos da web e móveis de maneira rápida e fácil. Ele oferece uma plataforma de hospedagem gerenciada na nuvem para vários tipos de aplicativos, incluindo aplicativos da web, APIs, aplicativos móveis. O Azure App Service fornece uma plataforma de hospedagem gerenciada que lida com muitos dos aspectos de infraestrutura, como gerenciamento de servidores, escalabilidade, equilíbrio de carga e monitoramento. 

A seguir temos um exemplo do bloco de variáveis tanto para Windows (AplicativoWebWindows) quanto Linux (AplicativoWebLinux), e após temos os detalhes de cada argumento.

Exemplo de uso:
```csharp
AplicativoWebWindows = {
    NomeAplicativos      = ["application-db"]
    NomeInstancia        = "projeto-windows"
    NumeroInstancias     = 1
    TamanhoComputacional = "B1"
    GrupoRecurso         = "uniacademia"
    Regiao               = "eastus2"
}

AplicativoWebLinux = {
    NomeAplicativos      = ["app-linux"]
    NomeInstancia        = "projeto-linux"
    NumeroInstancias     = 1
    TamanhoComputacional = "S1"
    GrupoRecurso         = "uniacademia"
    Regiao               = "eastus2"
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeAplicativos  | Preencha a lista com os nomes dos apps |  - Os nomes deve ter entre 3 a 63 caracteres <br> - Os nomes devem ter apenas letras minúsculas, números e o caratere '-', e não podem começar ou terminar com '-'
NomeInstancia | Nome da instância que conterá os aplicativos | - O nome da instância deve ter entre 1 a 60 caracteres <br> - O nome pode conter letras minúsculas ou maiscúlas, números e o cactere '-'
NumeroInstancias | Quantidade de instâncias a serem  usadas| - O número de instâncias deve ser entre 1 a 30
TamanhoComputacional| Refere ao conjunto de hardware a ser usado: memória RAM e Cpu | - Para mais informações acesse: [Visão geral do plano do Serviço de Aplicativo do Azure](https://learn.microsoft.com/pt-br/azure/app-service/overview-hosting-plans) 
GrupoRecurso	| O nome do grupo de recursos do Azure onde os recursos serão criados	| - É necessário definir um grupo de recursos para organizar e gerenciar os recursos
Regiao	| A região do Azure onde os Azure Container e Azure Storage serão implantadoss	| - Escolha a região geográfica onde os recursos serão hospedados. Isso pode afetar o desempenho e a disponibilidade.

### Azure Functions

É um serviço de computação serverless fornecido pela Microsoft Azure. O Azure Functions é uma plataforma serverless que permite aos desenvolvedores executar código em resposta a eventos sem se preocupar com a infraestrutura subjacente. Você paga apenas pelo tempo de execução do código. 

A seguir temos um exemplo do bloco de variáveis tanto para Windows (FunctionWebWindows) quanto Linux (FunctionWebLinux), e após temos os detalhes de cada argumento. Alguns argumentos já foram detalhados no recurso anterior como: NomeInstancia, NumeroInstancia, TamanhoComputacional, GrupoRecurso e Regiao, focaremos nos argumentos ainda não mencionados.

Exemplo de uso:
```csharp
FunctionWebWindows = {
    NomeFunctions        = ["app-functions"]
    NomeInstancia        = "functions-windows-plan"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "stwindowplan"
    GrupoRecurso         = "uniacademia"
    Regiao               = "eastus2"
}

FunctionWebLinux = {
    NomeFunctions        = ["app-linux-functions"]
    NomeInstancia        = "functions-linux-plan"
    NumeroInstancias     = 2
    TamanhoComputacional = "B1"
    ContaArmazenamento   = "stfunctionlinux"
    GrupoRecurso         = "uniacademia"
    Regiao               = "eastus2"
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeFunctions | Preencha a lista com os nomes das functions| - Os nomes devem ter entre 3 a 63 caracteres <br> - Os nomes devem conter apenas letras minúsculas, números e o caractere '-'; não pode começar ou terminar com '-'
ContaArmazenamento |  É um serviço da Microsoft Azure que fornece uma solução de armazenamento em nuvem altamente escalável e durável.  | - ContaArmazenamento deve ter entre 3 a 24 caracteres <br> - ContaArmazenamento deve conter apenas letras minúsculas e números
