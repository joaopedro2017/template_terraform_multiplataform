provider "azurerm" {
  features {}
  skip_provider_registration = true
  # client_id                  = "<client_id>"
  # client_secret              = "<client_secret>"
  # tenant_id                  = "<tenant_id>"
  # subscription_id            = "<subscription_id>"
}

provider "aws" {
  # access_key = "<access_key>"
  # secret_key = "<secret_key>"
  # region     = "<region>"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-gitops"
    storage_account_name = "gitopstcc"
    container_name       = "terrafrom"
    key                  = "multiplataforma.terraform.tfstate"
  }
}

locals {

  # Se Grupo de Recurso Estiver com o valor Criar (eles serao feitos para cada recurso), outro valor qq sera ja provisionado,
  ## CRIAR_NOVO
  GrupoRecurso = "CRIAR_NOVO"
  Regiao       = "us-east-2"
}

