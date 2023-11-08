provider "aws" {
  access_key = "access_key"
  secret_key = "secret_key"
  region     = "us-east-2"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id                  = "client_id"
  client_secret              = "client_secret"
  tenant_id                  = "tenant_id"
  subscription_id            = "subscription_id"
}


terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-gitops"
    storage_account_name = "gitopstcc"
    container_name       = "terrafrom"
    key                  = "multiplataforma.terraform.tfstate"
    access_key           = "<access_key>"
  }
}

locals {

  # Se Grupo de Recurso Estiver com o valor CRIAR_NOVO (eles serao feitos para cada recurso), outro valor qq sera ja provisionado,
  ## CRIAR_NOVO
  AzureGrupoRecurso = "uniacademia"
  AzureRegiao       = "eastus2"

  AWSRegiao = "us-east-2"
}

