[ ![back](./img/back.png) ](../README.md)

## Microsoft Azure - Storage

### Storage Container

É uma parte fundamental do serviço de armazenamento em nuvem oferecido pela Microsoft Azure. Ele é usado para armazenar objetos, que podem ser arquivos, documentos, imagens, vídeos e dados diversos. Um container é um contêiner lógico que permite organizar e gerenciar objetos relacionados de maneira eficiente. Os containers são um componente fundamental da plataforma de armazenamento em nuvem da Microsoft Azure e são altamente versáteis, adequados para atender a diversas necessidades de armazenamento de dados em nuvem.

Exemplo de uso:
```csharp
ContainerArmazenamento = {
    NomeContainers     = ["container1", "container2"]
    ContaArmazenamento = "storagetest"
    GrupoRecurso       = "uniacademia"
    Regiao             = "eastus2"
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeContainers     | Preencha a lista com os nomes dos containers  | - Os nomes devem ter entre 3 a 63 caracteres <br> - Os nomes devem conter apenas letras minúsculas, números e o caratere '-' e não podem começar ou terminar com '-'
ContaArmazenamento |  É um serviço da Microsoft Azure que fornece uma solução de armazenamento em nuvem altamente escalável e durável.  | - ContaArmazenamento deve ter entre 3 a 24 caracteres <br> - ContaArmazenamento deve conter apenas letras minúsculas e números
GrupoRecurso	| O nome do grupo de recursos do Azure onde os recursos serão criados	| - É necessário definir um grupo de recursos para organizar e gerenciar os recursos
Regiao	| A região do Azure onde os Azure Container e Azure Storage serão implantadoss	| - Escolha a região geográfica onde os recursos serão hospedados. Isso pode afetar o desempenho e a disponibilidade.
