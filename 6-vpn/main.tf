module "vpn" {
  source  = "terraform-google-modules/vpn/google"
  version = "~> 1.2.0"
 
  for_each           = var.vpns
  project_id         = each.value.project_id
  network            = each.value.network
  region             = each.value.region
  gateway_name       = each.value.gateway_name
  tunnel_name_prefix = each.value.tunnel_name_prefix
  shared_secret      = each.value.shared_secret
  tunnel_count       = each.value.tunnel_count
  peer_ips           = each.value.peer_ips
  route_priority     = each.value.route_priority
  remote_subnet      = each.value.remote_subnet
}