resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = var.vpn_name
  network = var.network
  region  = var.region
}

resource "google_compute_vpn_tunnel" "vpn_tunnel" {
  name          = var.tunnel_name
  target_vpn_gateway = google_compute_vpn_gateway.vpn_gateway.id
  peer_ip       = var.peer_ip
  shared_secret = var.shared_secret
}