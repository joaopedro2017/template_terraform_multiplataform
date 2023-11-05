module "virtual_machine_windows" {
  source              = "../../azure/compute/virtual_machine_windows"
  count               = length(var.MaquinaVirtualWindows.NomeMaquinasVirtuais) > 0 ? 1 : 0
  machine_names       = var.MaquinaVirtualWindows["NomeMaquinasVirtuais"]
  image_publisher     = var.MaquinaVirtualWindows["ImagemFornecedor"]
  image_offer         = var.MaquinaVirtualWindows["ImagemSistemaOperacional"]
  image_sku           = var.MaquinaVirtualWindows["ImagemDistribuicao"]
  image_version       = var.MaquinaVirtualWindows["ImagemVersao"]
  vm_size             = var.MaquinaVirtualWindows["TamanhoComputacional"]
  admin_username      = var.MaquinaVirtualWindows["UsuarioAdministrador"]
  admin_password      = var.MaquinaVirtualWindows["SenhaAdministrador"]
  resource_group_name = var.MaquinaVirtualWindows["GrupoRecurso"]
  location            = var.MaquinaVirtualWindows["Regiao"]
}

module "virtual_machine_linux" {
  source              = "../../azure/compute/virtual_machine_Linux"
  count               = length(var.MaquinaVirtualLinux.NomeMaquinasVirtuais) > 0 ? 1 : 0
  machine_names       = var.MaquinaVirtualLinux["NomeMaquinasVirtuais"]
  image_publisher     = var.MaquinaVirtualLinux["ImagemFornecedor"]
  image_offer         = var.MaquinaVirtualLinux["ImagemSistemaOperacional"]
  image_sku           = var.MaquinaVirtualLinux["ImagemDistribuicao"]
  image_version       = var.MaquinaVirtualLinux["ImagemVersao"]
  vm_size             = var.MaquinaVirtualLinux["TamanhoComputacional"]
  admin_username      = var.MaquinaVirtualLinux["UsuarioAdministrador"]
  admin_password      = var.MaquinaVirtualLinux["SenhaAdministrador"]
  resource_group_name = var.MaquinaVirtualLinux["GrupoRecurso"]
  location            = var.MaquinaVirtualLinux["Regiao"]
}
