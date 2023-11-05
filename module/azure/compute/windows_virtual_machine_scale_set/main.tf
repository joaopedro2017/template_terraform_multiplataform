module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-vmss-wind-${var.vmss_name}"
  location            = var.location
  tags = {
    VMSSWindows = var.vmss_name
    Regiao      = var.location
  }
}

module "virtual_network" {
  source               = "../../networking/virtual_network"
  virtual_network_name = "VMSS-Windows-Terraform-VNet"
  resource_group_name  = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location             = var.location
  address_space        = ["10.0.2.0/24"]
}

module "subnet" {
  source               = "../../networking/subnet"
  subnet_name          = "VMSS-Windows-Terraform-Subnet"
  virtual_network_name = module.virtual_network.name
  resource_group_name  = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  address_prefixes     = ["10.0.2.0/25"]
}

resource "azurerm_windows_virtual_machine_scale_set" "example" {
  name                = var.vmss_name
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  sku                 = var.vm_size
  instances           = var.number_instances
  admin_username      = var.admin_password
  admin_password      = var.admin_username

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${var.vmss_name}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = module.subnet.id
    }
  }
}
