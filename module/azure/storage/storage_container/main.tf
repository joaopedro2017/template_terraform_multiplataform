module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-container-${var.storage_account_name}"
  location            = var.location
  tags = {
    StorageAccount = var.storage_account_name
    Regiao         = var.location
  }
}

module "storage_account" {
  source              = "../storage_account"
  storage_name        = var.storage_account_name
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  depends_on          = [module.resource_group]
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.container_names)
  name                  = var.container_names[count.index]
  storage_account_name  = module.storage_account.name
  container_access_type = "private"
}
