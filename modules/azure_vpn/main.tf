resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.vpn_name
  location            = var.location
  resource_group_name = var.resource_group
  type                = "Vpn"
  vpn_type            = "RouteBased"

  sku = "VpnGw1"

  ip_configuration {
    public_ip_address_id = azurerm_public_ip.vpn_ip.id
    subnet_id            = var.subnet_id
  }
}

resource "azurerm_public_ip" "vpn_ip" {
  name                = "vpn-public-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Dynamic"
}