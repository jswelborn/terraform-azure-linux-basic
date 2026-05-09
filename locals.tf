locals {
  resource_group_name = "rg-80020000-ansible"
  location            = "East US"
  subnet_id           = "/subscriptions/6133c7a0-a417-43b9-acb9-1bdd65114bbe/resourceGroups/ht-hts-eastus-core-rg/providers/Microsoft.Network/virtualNetworks/ht-hts-eastus-vnet1/subnets/ht-hts-eastus-utilityservices-app-prod-subnet-private"

  linux_vm_name   = "hts001cldans010"
  windows_vm_name = "hts001cldans013"

  aws_region = "us-east-1"
  aws_assume_role_arn = "arn:aws:iam::027856332022:role/AccessAUTO"

  aws_linux_vm_name   = "hts001cldans014"
  aws_windows_vm_name = "hts001cldans016"

  aws_linux_tags = {
    costcenter   = "80020000"
    businessunit = "Hearst Technology Services"
    product      = "Systems-Hearst-Com"
    application  = "General Compute"
    environment  = "dev"
    supportteam  = "hts.sre@hearst.com"

    Name = local.aws_linux_vm_name
  }

  aws_windows_tags = {
    costcenter   = "80020000"
    businessunit = "Hearst Technology Services"
    product      = "Systems-Hearst-Com"
    application  = "General Compute"
    environment  = "dev"
    supportteam  = "hts.sre@hearst.com"

    Name = local.aws_windows_vm_name
  }
}