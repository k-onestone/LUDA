output "public_net_id" {
  value       = data.openstack_networking_network_v2.public.id
  description = "ID of the external public network"
}

output "security_net_id" {
  value       = openstack_networking_network_v2.security.id
  description = "ID of the security network"
}

output "security_subnet_id" {
  value       = openstack_networking_subnet_v2.security.id
  description = "ID of the security subnet"
}

output "zone1_net_id" {
  value       = openstack_networking_network_v2.zone1.id
  description = "ID of the zone1 network"
}

output "zone1_subnet_id" {
  value       = openstack_networking_subnet_v2.zone1.id
  description = "ID of the zone1 subnet"
}

output "shared_network_id" {
  value       = openstack_networking_network_v2.shared.id
  description = "ID of the shared network"
}

output "shared_subnet_id" {
  value       = openstack_networking_subnet_v2.shared.id
  description = "ID of the shared subnet"
}

output "router_interface_port_id" {
  value       = openstack_networking_router_interface_v2.security_if.port_id
  description = "Port ID of router's interface on security subnet"
}

output "vpn_net_id" {
  value       = openstack_networking_network_v2.vpn.id
  description = "VPN 전용 네트워크 ID"
}
