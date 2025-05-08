output "bastion1_ip" {
  description = "Bastion1의 고정 IP"
  value       = var.bastion_zone1_ip
}

output "zone1_ip" {
  description = "Zone1 애플리케이션 서버의 고정 IP"
  value       = var.zone1_fixed_ip
}

output "elk_ip_security" {
  description = "ELK 서버의 security-net 고정 IP"
  value       = var.elk_fixed_ip_security
}

output "elk_ip_shared" {
  description = "ELK 서버의 shared-net 고정 IP"
  value       = var.elk_fixed_ip_shared
}

output "vpn_ip_shared" {
  description = "VPN 서버의 shared-net 고정 IP"
  value       = var.vpn_fixed_ip_shared
}

output "vpn_ip_security" {
  description = "VPN 서버의 security-net 고정 IP"
  value       = var.vpn_fixed_ip_security
}

output "ids_ip" {
  description = "IDS 고정 IP"
  value       = var.ids_fixed_ip
}

output "ips_ip" {
  description = "IPS 고정 IP"
  value       = var.ips_fixed_ip
}

output "waf_ip" {
  description = "WAF 고정 IP"
  value       = var.waf_fixed_ip
}
