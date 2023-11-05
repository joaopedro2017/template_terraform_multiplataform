module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-func-wind-${var.plan_name}"
  location            = var.location
  tags = {
    FunctionWindows = var.plan_name
    Regiao          = var.location
  }
}

module "plan" {
  source              = "../service_plan"
  plan_name           = var.plan_name
  os_type             = "Windows"
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  depends_on          = [module.resource_group]
}

module "storage_account" {
  source              = "../../storage/storage_account"
  storage_name        = var.storage_name
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  depends_on          = [module.resource_group]
}

resource "azurerm_windows_function_app" "function_windows" {
  count               = length(var.function_names)
  name                = var.function_names[count.index]
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location

  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.primary_key
  service_plan_id            = module.plan.id

  site_config {
    always_on         = "true"
    use_32_bit_worker = "false"
    health_check_path = "/KeepAlive"
  }
}
