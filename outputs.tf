output "linux_vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "windows_vm_name" {
  value = azurerm_windows_virtual_machine.windows_vm.name
}

output "aws_linux_instance_name" {
  value = aws_instance.linux_instance.tags["Name"]
}

output "aws_linux_instance_private_ip" {
  value = aws_instance.linux_instance.private_ip
}