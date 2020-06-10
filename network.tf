resource "azurerm_virtual_network" "test03" {
  name                = "astf-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.test03.name
  address_space       = ["172.16.1.0/24"]
}

resource "azurerm_subnet" "Subnet01" {
  name                 = "Subnet01"
  resource_group_name  = azurerm_resource_group.test03.name
  virtual_network_name = azurerm_virtual_network.test03.name
  address_prefix       = "172.16.1.0/27"
}

resource "azurerm_network_security_group" "astf-instance" {
    name                = "astf-instance-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.test03.name

    security_rule {
        name                       = "HTTP"
        priority                   = 250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH"
        priority                   = 255
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = var.ssh-source-address
        destination_address_prefix = "*"
    }
}
