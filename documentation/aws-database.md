[ ![back](./img/back.png) ](../README.md)

## Amazon WebService - Database

### Relational Database Service (RDS)
É um serviço de banco de dados gerenciado oferecido pela Amazon Web Services (AWS) que facilita a implantação, operação e escalabilidade de bancos de dados relacionais na nuvem. Suporte a diversos mecanismos de banco de dados: O Amazon RDS oferece suporte a uma variedade de mecanismos de banco de dados relacionais populares, como MySQL, PostgreSQL, Oracle, Microsoft SQL Server e Amazon Aurora (um mecanismo de banco de dados compatível com MySQL e PostgreSQL, projetado para alto desempenho e escalabilidade). 

O argumento "Mecanismo" determinará qual banco relacional será provisionado, na sequência temos um exemplo do bloco de argumentos e após os detalhes de cada argumento.

Exemplo de uso:
```csharp
  ServicoBancoRelacional = {
    NomeBancos           = ["banco1", "banco2"]
    ArmazenamentoAlocado = 10
    Mecanismo            = "mysql"
    MecanismoVersao      = "5.7"
    TipoInstancia        = "db.t3.micro"
    NomeUsuario          = "foo"
    SenhaUsuario         = "foobarbaz"
    GrupoParametro       = "default.mysql5.7"
    Regiao               = local.AWSRegiao
  }
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeBancos  | Preencha a lista com os nomes para os bancos. | - Cada nome deve conter entre 3 a 60 caracteres <br> - Os nomes devem conter apenas letras minúsculas e números
ArmazenamentoAlocado | Refere à quantidade de espaço de armazenamento (GigaBytes) que é provisionada para um banco de dados RDS específico. | Valor inteiro maior que 0
Mecanismo | Refere-se ao software de banco de dados subjacente que é usado para armazenar, gerenciar e recuperar dados. | - Forneça o valor desejado <br> - Exemplos: <br> - mysql <br> - postgresql <br> - oracle <br> - sqlserver <br> -  mariadb
MecanismoVersao    | A versão específica do mecanismo de banco de dados a ser usada | - Consulte a versão de cada mecanismo <br> - Exemplos: <br> - mysql: 8.0.34; 8.0.28; 5.7.37 entre outros
TipoInstancia | É uma combinação específica de recursos de CPU, memória, armazenamento e capacidades de rede, projetada para atender a diferentes necessidades e cargas de trabalho. | - Exemplos: <br> - t2.nano <br> - t2.micro <br> - t2.small <br> - t2.large  <br> - Consulte os tipos de instâncias disponíveis para sua região no Console AWS - [Tipos de Instâncias](https://us-east-2.console.aws.amazon.com/ec2/home?region=us-east-2#InstanceTypes:)
NomeUsuario | Nome de usuário usado para fazer login em uma instância específica após a criação.  | - É importante definir um nome de usuário que será usado para acessar a instância.
SenhaUsuario | A senha do administrador para fazer login na instância. |  - Certifique-se de que a senha seja forte e segura para garantir a segurança da instância.
GrupoParametro  | É usado ao criar uma instância de banco de dados no Amazon RDS (Relational Database Service) para especificar o nome do grupo de parâmetros do banco de dados que deve ser associado à instância. | 
Regiao | É uma área geográfica onde os data centers e infraestrutura de serviços da AWS estão localizados.  | - Exemplos: <br> - us-east-2 > US East (Ohio)  <br> - us-east-1 > US East (N. Virginia) <br> - ap-east-1 > Asia Pacific (Hong Kong) <br> - Observe no Console AWS qual região esta em uso <br> - Para mais regiões consulte [Regiões, zonas de disponibilidade e Local Zones](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)

### Database Athena

É um serviço de consulta interativa e análise de dados da Amazon Web Services (AWS) que permite que você execute consultas SQL em dados armazenados no Amazon S3, sem a necessidade de carregar ou transformar esses dados em um banco de dados tradicional. Embora o Athena não seja um "banco de dados" no sentido convencional, ele é uma ferramenta poderosa para análise de dados em larga escala e é amplamente utilizado para explorar, consultar e obter insights de grandes conjuntos de dados armazenados no Amazon S3.

Exemplo de uso:
```csharp
  BancoAthena = {
    NomeBancos = ["banco1", "banco2"]
    NomeBucket = "buscket-athena"
  }
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeBancos  | Preencha a lista com os nomes para os bancos. | - Cada nome deve conter entre 3 a 32 caracteres.  <br> - Os nomes devem conter apenas letras minúsculas, números e o caractere '_'
NomeBucket | Preencha o nome do Bucket (S3) onde será armazenados os dados | - O nome deve conter entre 3 a 63 caracteres <br> - O nome do bucket deve conter apenas letras minúsculas, números e o caratere '-' e não pode começar ou terminar com '-' 