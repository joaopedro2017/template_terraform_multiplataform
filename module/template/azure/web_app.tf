module "windows_web_app" {
  source              = "../../azure/compute/windows_web_app"
  count               = length(var.AplicativoWebWindows.NomeAplicativos) > 0 && length(var.AplicativoWebWindows.NomeInstancia) > 0 ? 1 : 0
  web_app_names       = var.AplicativoWebWindows["NomeAplicativos"]
  plan_name           = var.AplicativoWebWindows["NomeInstancia"]
  sku_name            = var.AplicativoWebWindows["TamanhoComputacional"]
  worker_count        = var.AplicativoWebWindows["NumeroInstancias"]
  resource_group_name = var.AplicativoWebWindows["GrupoRecurso"]
  location            = var.AplicativoWebWindows["Regiao"]
}

module "linux_web_app" {
  source              = "../../azure/compute/linux_web_app"
  count               = length(var.AplicativoWebLinux.NomeAplicativos) > 0 && length(var.AplicativoWebLinux.NomeInstancia) > 0 ? 1 : 0
  web_app_names       = var.AplicativoWebLinux["NomeAplicativos"]
  plan_name           = var.AplicativoWebLinux["NomeInstancia"]
  sku_name            = var.AplicativoWebLinux["TamanhoComputacional"]
  worker_count        = var.AplicativoWebLinux["NumeroInstancias"]
  resource_group_name = var.AplicativoWebLinux["GrupoRecurso"]
  location            = var.AplicativoWebLinux["Regiao"]
}
