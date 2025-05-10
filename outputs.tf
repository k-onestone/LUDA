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

output "bastion1_instance_id" {
  description = "Bastion1 인스턴스 ID"
  value       = module.bastion1.bastion_instance_id
}

output "bastion1_floating_ip" {
  description = "Bastion1 Floating IP 주소"
  value       = module.bastion1.bastion_floating_ip
}

output "bastion1_internal_ip" {
  description = "Bastion1의 zone1-net 내부 IP"
  value       = module.bastion1.bastion_internal_ip
}

output "bastion1_external_ip" {
  description = "Bastion1의 security-net 외부 IP"
  value       = module.bastion1.bastion_external_ip
}
