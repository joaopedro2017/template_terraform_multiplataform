module "windows_virtual_machine_scale_set" {
  source              = "../../azure/compute/windows_virtual_machine_scale_set"
  count               = length(var.ConjuntoEscalarMaquinaVirtualWindows.NomeConjuntoMaquinaVirtual) > 0 ? 1 : 0
  vmss_name           = var.ConjuntoEscalarMaquinaVirtualWindows["NomeConjuntoMaquinaVirtual"]
  number_instances    = var.ConjuntoEscalarMaquinaVirtualWindows["NumeroInstancias"]
  image_publisher     = var.ConjuntoEscalarMaquinaVirtualWindows["ImagemFornecedor"]
  image_offer         = var.ConjuntoEscalarMaquinaVirtualWindows["ImagemSistemaOperacional"]
  image_sku           = var.ConjuntoEscalarMaquinaVirtualWindows["ImagemDistribuicao"]
  image_version       = var.ConjuntoEscalarMaquinaVirtualWindows["ImagemVersao"]
  vm_size             = var.ConjuntoEscalarMaquinaVirtualWindows["TamanhoComputacional"]
  admin_password      = var.ConjuntoEscalarMaquinaVirtualWindows["UsuarioAdministrador"]
  admin_username      = var.ConjuntoEscalarMaquinaVirtualWindows["SenhaAdministrador"]
  location            = var.ConjuntoEscalarMaquinaVirtualWindows["Regiao"]
  resource_group_name = var.ConjuntoEscalarMaquinaVirtualWindows["GrupoRecurso"]
}

module "linux_virtual_machine_scale_set" {
  source              = "../../azure/compute/linux_virtual_machine_scale_set"
  count               = length(var.ConjuntoEscalarMaquinaVirtualLinux.NomeConjuntoMaquinaVirtual) > 0 ? 1 : 0
  vmss_name           = var.ConjuntoEscalarMaquinaVirtualLinux["NomeConjuntoMaquinaVirtual"]
  number_instances    = var.ConjuntoEscalarMaquinaVirtualLinux["NumeroInstancias"]
  image_publisher     = var.ConjuntoEscalarMaquinaVirtualLinux["ImagemFornecedor"]
  image_offer         = var.ConjuntoEscalarMaquinaVirtualLinux["ImagemSistemaOperacional"]
  image_sku           = var.ConjuntoEscalarMaquinaVirtualLinux["ImagemDistribuicao"]
  image_version       = var.ConjuntoEscalarMaquinaVirtualLinux["ImagemVersao"]
  vm_size             = var.ConjuntoEscalarMaquinaVirtualLinux["TamanhoComputacional"]
  admin_password      = var.ConjuntoEscalarMaquinaVirtualLinux["UsuarioAdministrador"]
  admin_username      = var.ConjuntoEscalarMaquinaVirtualLinux["SenhaAdministrador"]
  location            = var.ConjuntoEscalarMaquinaVirtualLinux["Regiao"]
  resource_group_name = var.ConjuntoEscalarMaquinaVirtualLinux["GrupoRecurso"]
}
