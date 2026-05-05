locals {
  resource_group_name = "rg-80020000-ansible"
  location            = "East US"
  subnet_id           = "/subscriptions/6133c7a0-a417-43b9-acb9-1bdd65114bbe/resourceGroups/ht-hts-eastus-core-rg/providers/Microsoft.Network/virtualNetworks/ht-hts-eastus-vnet1/subnets/ht-hts-eastus-utilityservices-app-prod-subnet-private"

  linux_vm_name   = "hts001cldans010"
  windows_vm_name = "hts001cldans011"
}