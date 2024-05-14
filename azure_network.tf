# Creating azure network 
resource "azurerm_virtual_network" "ashuaz-network" {
  resource_group_name = data.azurerm_resource_group.ashu-existing-rsgrp.name
  location = data.azurerm_resource_group.ashu-existing-rsgrp.location
  name = "ashu-network"
  address_space = [ "10.0.0.0/16" ]
  
}

# creating subnet 
resource "azurerm_subnet" "ashu-subnet1" {
  name = "ashu-internal-subnet"
  virtual_network_name = azurerm_virtual_network.ashuaz-network.name
  resource_group_name = data.azurerm_resource_group.ashu-existing-rsgrp.name
  address_prefixes = [ "10.0.1.0/24" ]
}

# creating network interface from subnet 
resource "azurerm_network_interface" "ashu-nic1" {
  name = "ashu-network-interface1"
  resource_group_name = data.azurerm_resource_group.ashu-existing-rsgrp.name
  location = data.azurerm_resource_group.ashu-existing-rsgrp.location

  ip_configuration {
    subnet_id = azurerm_subnet.ashu-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ashu-public-ip1.id
    name = "ashu-ip1"
  }
  
}
# creating public ip 
resource "azurerm_public_ip" "ashu-public-ip1" {
    name = "ashupub-ip1"
    resource_group_name = data.azurerm_resource_group.ashu-existing-rsgrp.name
    location = data.azurerm_resource_group.ashu-existing-rsgrp.location
    allocation_method = "Static"
  
}