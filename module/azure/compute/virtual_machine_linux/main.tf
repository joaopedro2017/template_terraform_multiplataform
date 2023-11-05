module "resource_group" {
  source              = "../../management/resource_group"
  count               = var.resource_group_name == "CRIAR_NOVO" ? 1 : 0
  resource_group_name = "tf-vmss-linux-${var.machine_names[0]}"
  location            = var.location
  tags = {
    VMLinux = var.machine_names[0]
    Regiao  = var.location
  }
}

module "virtual_network" {
  source               = "../../networking/virtual_network"
  virtual_network_name = "VM-Linux-Terraform-VNet"
  resource_group_name  = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location             = var.location
  address_space        = ["10.0.1.0/24"]
}

module "subnet" {
  source               = "../../networking/subnet"
  subnet_name          = "VM-Linux-Terraform-Subnet"
  virtual_network_name = module.virtual_network.name
  resource_group_name  = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  address_prefixes     = ["10.0.1.0/25"]
}

module "network_interface" {
  source              = "../../networking/network_interface"
  count               = length(var.machine_names)
  nic_name            = "${var.machine_names[count.index]}-nic"
  resource_group_name = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet.id
}

resource "azurerm_linux_virtual_machine" "linux" {
  count                           = length(var.machine_names)
  name                            = var.machine_names[count.index]
  resource_group_name             = var.resource_group_name == "CRIAR_NOVO" ? module.resource_group[0].name : var.resource_group_name
  location                        = var.location
  network_interface_ids           = [module.network_interface[count.index].id]
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
