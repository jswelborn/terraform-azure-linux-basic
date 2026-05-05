output "linux_vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "windows_vm_name" {
  value = azurerm_windows_virtual_machine.windows_vm.name
}