output "private_ip_shared" {
  description = "VPN 인스턴스 shared-net 고정 IP"
  value       = var.vpn_fixed_ip_shared
}

output "private_ip_security" {
  description = "VPN 인스턴스 security-net 고정 IP"
  value       = var.vpn_fixed_ip_security
}

output "floating_ip" {
  description = "VPN 인스턴스 Floating IP"
  value       = openstack_networking_floatingip_v2.vpn_fip.address
}
