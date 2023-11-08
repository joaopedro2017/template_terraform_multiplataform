provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id                  = "ec576b13-d68d-4d0d-9701-a4577408b3da"
  client_secret              = "ypt8Q~MXaCN~G-3Dvm-BDQRxV1T_z18--VC38bK_"
  tenant_id                  = "62ccb864-6a1a-4b5d-8e1c-397dec1a8258"
  subscription_id            = "42ec78eb-cb14-4d94-8e57-30bf194a642b"
}

provider "aws" {
  access_key = "AKIATVQPH6L4F34X5MSQ"
  secret_key = "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"
  region     = "us-east-2"
}


terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-gitops"
    storage_account_name = "gitopstcc"
    container_name       = "terrafrom"
    key                  = "multiplataforma.terraform.tfstate"
    access_key           = "m7oKZQ3bUrbTb0avVTovN6gUo4fmU17Bicx0MZAwJcfZ81nAGYAV27x33bZarvgffoF5LbMT2dik+AStTHmeKw=="
  }
}

locals {

  # Se Grupo de Recurso Estiver com o valor CRIAR_NOVO (eles serao feitos para cada recurso), outro valor qq sera ja provisionado,
  ## CRIAR_NOVO
  AzureGrupoRecurso = "uniacademia"
  AzureRegiao       = "eastus2"

  AWSRegiao = "us-east-2"
}

