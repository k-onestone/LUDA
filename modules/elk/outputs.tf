output "elk_instance_id" {
  description = "ELK 인스턴스 ID"
  value       = openstack_compute_instance_v2.elk.id
}

output "elk_fixed_ip_shared" {
  description = "ELK 인스턴스 shared-net 고정 IP"
  value       = var.elk_fixed_ip_shared
}

output "elk_fixed_ip_security" {
  description = "ELK 인스턴스 security-net 고정 IP"
  value       = var.elk_fixed_ip_security
}
