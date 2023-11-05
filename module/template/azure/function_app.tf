module "windows_function_app" {
  source              = "../../azure/compute/windows_function_app"
  count               = length(var.FunctionWebWindows.NomeFunctions) > 0 && length(var.FunctionWebWindows.NomeInstancia) > 0 ? 1 : 0
  function_names      = var.FunctionWebWindows["NomeFunctions"]
  plan_name           = var.FunctionWebWindows["NomeInstancia"]
  sku_name            = var.FunctionWebWindows["TamanhoComputacional"]
  worker_count        = var.FunctionWebWindows["NumeroInstancias"]
  storage_name        = var.FunctionWebWindows["ContaArmazenamento"]
  resource_group_name = var.FunctionWebWindows["GrupoRecurso"]
  location            = var.FunctionWebWindows["Regiao"]
}

module "linux_function_app" {
  source              = "../../azure/compute/linux_function_app"
  count               = length(var.FunctionWebLinux.NomeFunctions) > 0 && length(var.FunctionWebLinux.NomeInstancia) > 0 ? 1 : 0
  function_names      = var.FunctionWebLinux["NomeFunctions"]
  plan_name           = var.FunctionWebLinux["NomeInstancia"]
  sku_name            = var.FunctionWebLinux["TamanhoComputacional"]
  worker_count        = var.FunctionWebLinux["NumeroInstancias"]
  storage_name        = var.FunctionWebLinux["ContaArmazenamento"]
  resource_group_name = var.FunctionWebLinux["GrupoRecurso"]
  location            = var.FunctionWebLinux["Regiao"]
}
