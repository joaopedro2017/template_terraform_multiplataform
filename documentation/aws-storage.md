[ ![back](./img/back.png) ](../README.md)

## Amazon WebService - Storage
### Simple Storage Service (S3)

É um serviço de armazenamento em nuvem oferecido pela Amazon Web Services (AWS). Ele é projetado para fornecer armazenamento escalável, durável e altamente disponível para uma ampla variedade de aplicativos e casos de uso. O Amazon S3 é projetado para armazenar objetos, que podem ser arquivos, documentos, imagens, vídeos ou qualquer tipo de dado digital. O S3 é amplamente utilizado por empresas e desenvolvedores para armazenamento de dados, hospedagem de sites, backup, análise de big data, compartilhamento de conteúdo e muito mais.

Exemplo de uso:
```csharp
ArmazenamentoS3 = {
    NomeBuckets = ["buckettest", "bucketdois"]
}
```

Argumentos | Especificações	| Restrições
-----------| ------------| ----------------------
NomeBuckets | Preencha a lista com os nomes dos buckets | - Cada nome deve ter entre 3 a 63 caracteres <br> - Os nomes dos bucket devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'



