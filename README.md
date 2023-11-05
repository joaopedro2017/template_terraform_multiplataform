# Template-Terraform

## Introdução

Estes templates permitem o provisionamento de recursos em múltiplas plataformas de nuvem, Azure e AWS, através do Terraform. O Terraform é uma ferramenta de infraestrutura como código que possibilita a criação, modificação e versionamento de infraestruturas de forma automatizada e repetitiva. A criação de um template que suporte múltiplas plataformas é de grande importância para empresas que utilizam diferentes nuvens, tornando o processo de gerenciamento de infraestrutura mais eficiente e padronizado. Com este template, é possível utilizar o Terraform para provisionar recursos de infraestrutura em diferentes plataformas de nuvem, reduzindo a necessidade de ferramentas específicas para cada plataforma.

Esse tutorial tem como objetivo fornecer um passo a passo para utilizar o template de criação de recursos nas plataformas Azure e AWS  através do Terraform.

## Pré-requisitos

Antes de utilizar o template para provisionar recursos nas plataformas Azure e AWS através do Terraform, é necessário ter os seguintes pré-requisitos instalados em seu ambiente:

* <b>Terraform:</b> o Terraform é uma ferramenta de infraestrutura como código utilizada para criar, alterar e provisionar recursos de infraestrutura de forma automatizada. Certifique-se de ter o Terraform instalado em sua máquina. Você pode baixá-lo em <b> [Terraform](https://www.terraform.io/downloads.html)</b>.
* <b>Credenciais das plataformas:</b> para provisionar recursos nas plataformas Azure e AWS, é necessário ter credenciais de acesso válidas para cada plataforma. Certifique-se de ter as credenciais necessárias para se conectar à plataforma desejada.
* <b>Configuração de ambiente:</b> é necessário configurar o ambiente de acordo com as especificações de cada plataforma. Certifique-se de ter as informações necessárias, como endereços de IPs, chaves de acesso e demais configurações para criar e provisionar recursos nas plataformas Azure e AWS .

## Passos:

1. Faça o download do template disponibilizado e extraia o conteúdo na pasta desejada;
2. Acesse a pasta Environment, crie uma nova pasta com o nome do seu novo ambiente e adicione os arquivos de configuração desejados para cada provider (Azure e AWS). Para cada provider, crie um arquivo com o nome azure.tf ou aws.tf, respectivamente;
3. Em cada arquivo azure.tf, aws.tf e gcp.tf, adicione os blocos de configuração dos recursos que deseja provisionar em cada plataforma. Você pode adicionar um ou mais recursos em cada arquivo, de acordo com suas necessidades.
4. Para cada recurso que deseja provisionar, edite os blocos de variáveis de acordo com as necessidades do seu ambiente. Certifique-se de que no bloco o atributo "create" esteja definido como true para que o Terraform possa provisioná-lo.
5. Caso não queira provisionar um recurso específico, basta definir o atributo "create" do bloco como false ou remover o bloco de variáveis relacionado ao recurso.
6. Após configurar todos os recursos desejados, execute o comando <b>terraform init </b>na pasta raiz do ambiente, para inicializar o projeto.
7. Execute o comando <b>terraform plan </b>para visualizar as alterações que serão feitas nos recursos antes de provisioná-los na nuvem.
8. Em seguida, execute o comando <b>terraform apply</b> para criar e provisionar os recursos na nuvem.

# Templates:

Neste repositório, você encontrará modelos para o provisionamento de recursos em duas das principais plataformas de nuvem: Microsoft Azure e Amazon Web Services (AWS).

Esses modelos estão organizados em quatro categorias principais:


* Armazenamento (Storage)
    * <b>Amazon WebService:</b>
        * <b>[Simple Storage Service S3](./documentation/aws-storage.md#simple-storage-service-s3)</b>
    * <b>Microsoft Azure:</b> 
        * <b>[Storage Container](./documentation/azure-storage.md#storage-container)</b>
* Banco de Dados (Database)
    * <b>Amazon WebService:</b>
        * <b>[Relational Database Service (RDS)](./documentation/aws-database.md#relational-database-service)</b>
        * <b>[Database Athena](./documentation/aws-database.md#database-athena)</b>
    * <b>Microsoft Azure:</b>
        * <b>[Database PostgreSQL](./documentation/azure-database.md#database-postgre)</b>
        * <b>[Database MySql](./documentation/azure-database.md#database-mysql)</b>
        * <b>[Database MariaDB](./documentation/azure-database.md#database-mariadb)</b>
        * <b>[Database Microsoft SQL](./documentation/azure-database.md#database-microsoft-sql)</b>
* Computação (Compute):
    * <b>Amazon WebService:</b> 
        * <b>[Elastic Compute Cloud (EC2)](./documentation/aws-compute.md#elastic-compute-cloud-ec2)</b>
        * <b>[Elastic Compute Cloud (EC2) Auto Scaling](./documentation/aws-compute.md#elastic-compute-cloud-ec2-auto-scaling)</b>
    * <b>Microsoft Azure:</b> 
        * <b>[Máquina Virtual](./documentation/azure-compute.md#máquina-virtual)</b>
        * <b>[Conjunto de Dimensionamento de Máquinas Virtuais](./documentation/azure-compute.md#conjunto-de-dimensionamento-de-máquinas-virtuais)</b>
* Servidor Web (WebServer)
    * <b>Amazon WebService:</b>
        * <b>[App Runner](./documentation/aws-webserver.md#app-runner)</b>
    * <b>Microsoft Azure:</b> 
        * <b>[App Service](./documentation/azure-webserver.md#app-service)</b>
        * <b>[Azure Functions](./documentation/azure-webserver.md#azure-functions)</b>