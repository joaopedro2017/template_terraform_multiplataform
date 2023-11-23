module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-ws-linux-${var.plan_name}"
  location            = var.location
  tags = {
    WebServerLinux = var.plan_name
    Regiao         = var.location
  }
}

module "plan" {
  source              = "../service_plan"
  plan_name           = var.plan_name
  os_type             = "Linux"
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
}

resource "azurerm_linux_web_app" "app" {
  count               = length(var.web_app_names)
  name                = var.web_app_names[count.index]
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  service_plan_id     = module.plan.id

  site_config {
    always_on         = "true"
    use_32_bit_worker = "false"
    health_check_path = "/KeepAlive"
  }
}
