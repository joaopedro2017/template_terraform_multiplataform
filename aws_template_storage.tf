module "aws_storage" {
  source = "./module/template/aws"

  ArmazenamentoS3 = {
    NomeBuckets = ["testegitopsjoao"]
  }
}
