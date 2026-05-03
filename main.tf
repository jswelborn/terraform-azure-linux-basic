locals {
  resource_group_name = "rg-80020000-ansible"
  location            = "East US"
  subnet_id           = "/subscriptions/6133c7a0-a417-43b9-acb9-1bdd65114bbe/resourceGroups/ht-hts-eastus-core-rg/providers/Microsoft.Network/virtualNetworks/ht-hts-eastus-vnet1/subnets/ht-hts-eastus-utilityservices-app-prod-subnet-private"
  vm_name             = "hts001cldans009"
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

resource "null_resource" "launch_aap_linux_bootstrap" {
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]

  triggers = {
    vm_name = local.vm_name
    vm_id   = azurerm_linux_virtual_machine.vm.id
  }

  provisioner "local-exec" {
    command = <<EOT
set -euo pipefail

response_file="$(mktemp)"

http_status=$(curl -k -sS -o "$response_file" -w "%%{http_code}" \
  -X POST \
  -H "Authorization: Bearer ${var.aap_token}" \
  -H "Content-Type: application/json" \
  -d '{
    "limit": "${local.vm_name}",
    "extra_vars": {
      "vm_name": "${local.vm_name}",
      "cloud_provider": "azure",
      "operating_system": "linux"
    }
  }' \
  "https://platform.cus-xpgr22.aws.ansiblecloud.redhat.com/api/controller/v2/workflow_job_templates/48/launch/")

echo "AAP HTTP status: $http_status"

if [ "$http_status" -lt 200 ] || [ "$http_status" -ge 300 ]; then
  echo "AAP launch failed:"
  cat "$response_file"
  exit 1
fi

rm -f "$response_file"
EOT
  }
}