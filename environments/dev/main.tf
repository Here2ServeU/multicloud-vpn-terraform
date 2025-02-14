module "aws_vpn" {
  source = "../../modules/aws_vpn"
  vpn_name = "t2s-dev-vpn"
  vpc_id = "vpc-12345678"
  customer_gateway_ip = "203.0.113.1"
  customer_gw_name = "t2s-dev-customer-gtw"
}

module "azure_vpn" {
  source = "../../modules/azure_vpn"
  vpn_name = "t2s-dev-azure-vpn"
  location = "eastus"
  resource_group = "t2s-dev-rg"
  subnet_id = "subnet-12345678"
}

module "gcp_vpn" {
  source = "../../modules/gcp_vpn"
  vpn_name = "t2s-dev-gcp-vpn"
  network = "t2s-dev-network"
  region = "us-east1"
  tunnel_name = "t2s-dev-tunnel"
  peer_ip = "192.168.1.1"
  shared_secret = "t2s-MySecureSecret"
}