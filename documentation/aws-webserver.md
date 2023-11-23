[ ![back](./img/back.png) ](../README.md)

## Amazon WebService - WebServer

### App Runner

É um serviço totalmente gerenciado pela Amazon Web Services (AWS) projetado para simplificar a implantação e dimensionamento de aplicativos em contêineres. Ele permite que os usuários construam, implantem e dimensionem facilmente aplicativos em contêineres rapidamente, sem a necessidade de gerenciar a infraestrutura subjacente.

Exemplo de uso:
```csharp
AplicacaoContainer = {
    NomeAplicacoes  = ["exemplo1"]
    ImagemContainer = "public.ecr.aws/aws-containers/hello-app-runner:latest"
    Porta           = "8000"
    TipoRepositorio = "ECR_PUBLIC"
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeAplicacoes  | Preencha a lista com os nomes das aplicações. | - Cada nome deve ter entre 3 a 40 caracteres <br> - Os nomes devem ter apenas letras minúsculas, números e os caracteres '-' e '_' <br> - Os nomes não podem iniciar com '-' ou '_'
ImagemContainer | As imagens do ECR são usadas para criar e executar contêineres em serviços como o AWS App Runner, Amazon ECS (Elastic Container Service), ou em qualquer ambiente que seja compatível com contêineres Docker. | - Consulte os valores antes de utilizar no template.
Porta          | Refere a porta que será utilizada para acessar dentro dos aplicativos implantados | - Forneça um valor numérico entre aspas
TipoRepositorio | Selecione o tipo de repositório para implementar no seu app.  | - Valores possíveis: <br> - Repositório privado: ECR <br> - Repositório público: ECR_PUBLIC

### Beanstalk Application

É um serviço da Amazon Web Services (AWS) que simplifica o processo de implantação, gerenciamento e escalabilidade de aplicativos na nuvem. O Elastic Beanstalk oferece um ambiente gerenciado para implantar e executar aplicativos, permitindo que os desenvolvedores se concentrem no código sem se preocupar com a infraestrutura subjacente.

Exemplo de uso:
```csharp
ServicoAplicacaoBeanstalk = {
    NomeAplicacoes = ["app1", "app3"]
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeAplicacoes | Preencha a lista com os nomes das aplicações. |  - Os nomes das aplicações devem conter apenas letras minúsculas, números e os caracteres: '-' e '_' <br> - Cada nome deve ter entre 3 e 100 caracteres