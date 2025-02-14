output "vpn_gateway_id" {
  value = google_compute_vpn_gateway.vpn_gateway.id
}

output "vpn_tunnel_id" {
  value = google_compute_vpn_tunnel.vpn_tunnel.id
}