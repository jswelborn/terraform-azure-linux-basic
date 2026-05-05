resource "azurerm_network_interface" "windows_nic" {
  name                = "${local.windows_vm_name}-nic"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = local.windows_vm_name
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = "Standard_D2s_v5"

  admin_username = "hetwinadmin"
  admin_password = var.hetwinadmin_default_password

  network_interface_ids = [
    azurerm_network_interface.windows_nic.id
  ]

  patch_mode = "AutomaticByPlatform"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 128
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-azure-edition"
    version   = "latest"
  }
}