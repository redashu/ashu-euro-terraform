# creating azure virtual machine of linux type 
resource "azurerm_linux_virtual_machine" "ashu-vm1" {
  name = "ashu-linux-vm1"
  resource_group_name = data.azurerm_resource_group.ashu-existing-rsgrp.name
  location = data.azurerm_resource_group.ashu-existing-rsgrp.location
  admin_username = "ashu"
  admin_password = "Eurofins@12345"
  disable_password_authentication = false 
  network_interface_ids = [ azurerm_network_interface.ashu-nic1.id ]
  size = "Standard_B1s" 
  # from here i copied from terraform docs
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  # till this 
}