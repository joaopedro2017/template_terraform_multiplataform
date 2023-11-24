[ ![back](./img/back.png) ](../README.md)

## Amazon WebService - Compute

### Elastic Compute Cloud (EC2)

É um serviço de computação na nuvem oferecido pela Amazon Web Services (AWS). EC2 permite que os usuários provisionem e gerenciem máquinas virtuais (VMs) chamadas "instâncias" na infraestrutura global da AWS. 

O argumento "ImagemSistemaOperacional" determinará qual o sistema operacional que será utilizado. Na sequência temos o bloco de exemplo sobre o provisionado e mais abaixo uma tabela sobre os argumentos necessários.

Exemplo de uso:
```csharp
MaquinaVirtualEC2 = {
    NomeInstancias           = ["vmteste1", "vmteste2"]
    ImagemSistemaOperacional = "ami-07b36ea9852e986ad"
    TipoInstancia            = "t2.micro"    
    NomeUsuario              = "<nomeUsuario>"
    SenhaUsuario             = "<senhaUsuario>"
    Regiao                   = "us-east-2"
  }
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeInstancias | Preencha a lista com o nomes para as VMs  | - A lista de nomes deve conter entre 1 e 32 nomes <br> - Cada nome deve ter entre 3 a 128 caracteres <br> - Nomes devem conter apenas letras minúsculas (a-z), números (0-9) e ponto (.)
ImagemSistemaOperacional |  É um modelo que contém a configuração de software (sistema operacional, servidor de aplicações e aplicações) necessária para executar a sua instância  | - Exemplos: <br> - ami-00744e52917f35c39 > Microsoft Windows Server 2022 <br> - ami-0ec3d9efceafb89e0 > Debian 12 (HVM) <br> - ami-07b36ea9852e986ad > Ubuntu Server 20.04 LTS  <br> - Consulte as imagens disponíveis para sua região no Console AWS - [Catálogo de AMIs](https://us-east-2.console.aws.amazon.com/ec2/home?region=us-east-2#AMICatalog:) e para mais  detalhes acesse [Imagens de máquina da Amazon (AMIs)](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/AMIs.html)
TipoInstancia | É uma combinação específica de recursos de CPU, memória, armazenamento e capacidades de rede, projetada para atender a diferentes necessidades e cargas de trabalho. | - Exemplos: <br> - t2.nano <br> - t2.micro <br> - t2.small <br> - t2.large  <br> - Consulte os tipos de instâncias disponíveis para sua região no Console AWS - [Tipos de Instâncias](https://us-east-2.console.aws.amazon.com/ec2/home?region=us-east-2#InstanceTypes:)
NomeUsuario | Nome de usuário usado para fazer login em uma instância específica após a criação.  | - É importante definir um nome de usuário que será usado para acessar a instância.
SenhaUsuario | A senha do administrador para fazer login na instância. |  - Certifique-se de que a senha seja forte e segura para garantir a segurança da instância.
Regiao | É uma área geográfica onde os data centers e infraestrutura de serviços da AWS estão localizados.  | - Exemplos: <br> - us-east-2 > US East (Ohio)  <br> - us-east-1 > US East (N. Virginia) <br> - ap-east-1 > Asia Pacific (Hong Kong) <br> - Observe no Console AWS qual região esta em uso <br> - Para mais regiões consulte [Regiões, zonas de disponibilidade e Local Zones](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)

### Elastic Compute Cloud (EC2) Auto Scaling 

É um serviço da Amazon Web Services (AWS) que permite dimensionar automaticamente o número de instâncias do Amazon Elastic Compute Cloud (EC2) com base nas necessidades da sua aplicação.

Na tabela a seguir, serão apresentados os argumentos para os recursos de <b>Elastic Compute Cloud (EC2) Auto Scaling</b>. Alguns dos argumentos, como ImagemSistemaOperacional, TipoInstancia e Regiao, já foram mencionados anteriormente. Portanto, focaremos nos argumentos restantes:

Exemplo de uso:
```csharp
GrupoAutoScalarEC2 = {
  NomeGrupo                = "grupo-teste"
  ImagemSistemaOperacional = "ami-05d8140b845a8aa7b"
  TipoInstancia            = "t2.micro"
  MinimoInstancia          = 0
  MaximoInstancia          = 32
  Regiao                   = "us-east-2"
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeGrupo | Nome atribuído ao grupo de instâncias EC2 | 
MinimoInstancia | Define o número mínimo de instâncias que o grupo de auto scaling deve manter em execução | - O valor tem que ser maior ou igual a 0
MaximoInstancia | Número máximo de instâncias que o grupo de auto scaling pode dimensionar | - O valor tem que estar entre 0 a 32, e maior que o MinimoInstancia