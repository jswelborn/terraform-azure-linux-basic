/*
locals {
  resource_group_name = "rg-80020000-ansible"
  location            = "East US"
  subnet_id           = "/subscriptions/6133c7a0-a417-43b9-acb9-1bdd65114bbe/resourceGroups/ht-hts-eastus-core-rg/providers/Microsoft.Network/virtualNetworks/ht-hts-eastus-vnet1/subnets/ht-hts-eastus-utilityservices-app-prod-subnet-private"
  vm_name             = "hts001cldans010"
}

resource "azurerm_network_interface" "nic" {
  name                = "${local.vm_name}-nic"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = local.vm_name
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = "Standard_D2s_v5"

  admin_username                  = "hetroot"
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = "hetroot"
    public_key = var.hetroot_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "97-gen2"
    version   = "latest"
  }
}
*/