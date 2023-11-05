[ ![back](./img/back.png) ](../README.md)

## Microsoft Azure - Database

### Database PostgreSQL

É um serviço de banco de dados gerenciado oferecido pela Microsoft Azure que permite implantar e gerenciar instâncias de bancos de dados PostgreSQL na nuvem. O serviço é projetado para suportar o PostgreSQL, um sistema de gerenciamento de banco de dados relacional de código aberto amplamente utilizado. Ele oferece compatibilidade com as versões mais recentes do PostgreSQL.

```csharp
ServidorPostgreSQL = {
    NomeBancos             = ["banco1", "banco2", "banco3"]
    NomeServidor           = "pinguim-fenix"
    Linguagem              = "English_United States.1252"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "11"
    TamanhoComputacional   = "B_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 5120
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.AzureGrupoRecurso
    Regiao                 = local.AzureRegiao
}
```

### Database MySql

É um serviço de banco de dados gerenciado oferecido pela Microsoft Azure que permite implantar e gerenciar instâncias de bancos de dados MySQL na nuvem. O serviço é projetado para suportar o MySQL, um sistema de gerenciamento de banco de dados relacional de código aberto amplamente utilizado. Ele oferece compatibilidade com as versões mais recentes do MySQL e mantém a integridade do mecanismo original.


```csharp
ServidorMySQL = {
    NomeBancos             = ["banco1", "banco2", "banco3"]
    NomeServidor           = "mysql-teste"
    Linguagem              = "utf8_unicode_ci"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "8.0"
    TamanhoComputacional   = "GP_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 5120
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.AzureGrupoRecurso
    Regiao                 = local.AzureRegiao
}
```

### Database MariaDB

É um serviço de banco de dados gerenciado oferecido pela Microsoft Azure que permite implantar e gerenciar instâncias de bancos de dados MariaDB na nuvem. MariaDB é um sistema de gerenciamento de banco de dados relacional de código aberto que é uma bifurcação do MySQL e é amplamente utilizado por muitas organizações. O serviço é projetado para suportar o MariaDB, garantindo a compatibilidade com as versões mais recentes do MariaDB.


```csharp
ServidorMariaDB = {
    NomeBancos             = ["banco1", "banco2", "banco3"]
    NomeServidor           = "servidor-mariadb"
    Linguagem              = "utf8_unicode_ci"
    ConjuntoCaracteres     = "utf8"
    Versao                 = "10.2"
    TamanhoComputacional   = "B_Gen5_2"
    RetencaoBackupDias     = 7
    TamanhoArmazenamentoMb = 51200
    UsuarioAdministrador   = "acctestun"
    SenhaAdministrador     = "H@Sh1CoR3!"
    GrupoRecurso           = local.AzureGrupoRecurso
    Regiao                 = local.AzureRegiao
}
```



Os atributos a seguir podemos considerar para os recursos: Database PostgreSQL, Database MySql e Database MariaDB.

Atributos	| Especificações	| Restrições
-----------| ------------| ----------------------
NomeBancos |Forneça uma lista com os nomes do(s) banco(s). | - Os nomes devem ter entre 1 a 128 caracteres <br> - Os nomes dos bancos devem conter apenas letras minúsculas, números e o caratere '-' e não pode começar ou terminar com '-'
NomeServidor  | Forneça o nome da instância de Banco. | 
Linguagem         |  Em um banco de dados se refere à forma como os dados são ordenados e comparados em consultas e operações de pesquisa. São importantes quando se trabalha com dados em diferentes idiomas ou culturas, pois diferentes idiomas podem ter regras específicas para a ordenação e comparação de caracteres. | - Consulte os valores em: <br> - PostgreSQL > [Collation Support](https://www.postgresql.org/docs/current/collation.html) <br> - MariaDB > [Collations](https://mariadb.com/kb/en/supported-character-sets-and-collations/#collations) <br> - MySql > [Character Sets and Collations in MySQL](https://dev.mysql.com/doc/refman/8.0/en/charset-mysql.html)
ConjuntoCaracteres    | É um conceito relacionado à codificação de caracteres em sistemas de gerenciamento de bancos de dados e em linguagens de programação. Ele define o conjunto de caracteres que um sistema ou aplicativo reconhece e pode manipular. Os conjuntos de caracteres são usados para representar e armazenar texto em diferentes idiomas e sistemas de escrita. | - Consulte os valores em: <br> - PostgreSQL > [Character Set Support](https://www.postgresql.org/docs/current/multibyte.html) <br> - MariaDB > [Character Sets](https://mariadb.com/kb/en/character-sets/) <br> - MySql > [Character Sets and Collations in MySQL](https://dev.mysql.com/doc/refman/8.0/en/charset-mysql.html)
Versao | Refere à versão específica do sistema de gerenciamento de banco de dados que está sendo usada pelo serviço. | 
TamanhoComputacional   | É uma unidade de identificação que descreve as características e a capacidade de uma instância específica do serviço, composto por um conjunto de características, como a quantidade de núcleos da CPU, a quantidade de memória, o armazenamento disponível e outras especificações. | - Exemplos: <br> - Basic > B_Gen4_1; B_Gen4_2; B_Gen5_1 <br> - General Purpose (GP) > GP_Gen4_2; GP_Gen4_4; GP_Gen4_16 <br> - Memory Optimized > MO_Gen5_2; MO_Gen5_4; MO_Gen5_8 <br> - Para mais valores consulte [Portal Azure](https://portal.azure.com/?quickstart=true#home)
RetencaoBackupDias    | Refere ao período de tempo durante o qual os backups automáticos de um banco de dados no Azure são retidos e mantidos.  | - Valor entre 7 a 35 dias
TamanhoArmazenamentoMb | Refere ao tamanho do armazenamento em megabytes (MB) alocado para o banco de dados. | - Valores: <br> - TamanhoComputacional Basic > de 5120 (5Gb) até 1048576 (1Tb) <br> - TamanhoComputacional Genaral Purpose ou Memory Optimized > de 5120 (5Gb) até 16777216 (16Gb)
UsuarioAdministrador  | Refere ao nome de usuário do administrador que é usado para acessar e gerenciar um servidor de banco de dados no Azure. O administrador é uma conta especial que possui privilégios elevados para configurar e gerenciar o servidor.  | - Nome de usuário deve ter entre 1 a 63 caracteres
SenhaAdministrador    | Contém a senha que você deseja atribuir à conta de administrador. | - A senha deve ter entre 8 a 128 caracteres <br> - A senha tem que conter letras maiúsculas e minúsculas, números e caracteres especiais como: ! @ # $ % ... 
GrupoRecurso	| O nome do grupo de recursos do Azure onde a VM será criada	| - É necessário definir um grupo de recursos para organizar e gerenciar os recursos relacionados à VM.
Regiao	| A região do Azure onde a VM será implantada	| - Escolha a região geográfica onde a VM será hospedada. Isso pode afetar o desempenho e a disponibilidade.

### Database Microsoft SQL

É um serviço de banco de dados gerenciado oferecido pela Microsoft Azure que permite implantar e gerenciar bancos de dados SQL Server na nuvem. O Azure SQL Database é projetado para oferecer compatibilidade com o Microsoft SQL Server, permitindo executar aplicativos que usam SQL Server na nuvem. Ele oferece suporte a várias versões do SQL Server.

```csharp

```

Atributos	| Especificações	| Restrições
-----------| ------------| ----------------------




