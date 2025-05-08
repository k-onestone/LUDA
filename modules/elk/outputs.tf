output "private_ip_shared" {
  description = "ELK 인스턴스 shared-net 고정 IP"
  value       = var.elk_fixed_ip_shared
}

output "private_ip_security" {
  description = "ELK 인스턴스 security-net 고정 IP"
  value       = var.elk_fixed_ip_security
}
