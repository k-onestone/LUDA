output "ips_instance_id" {
  description = "IPS 인스턴스 ID"
  value       = openstack_compute_instance_v2.ips.id
}

output "ips_fixed_ip" {
  description = "IPS 인스턴스 고정 IP"
  value       = var.ips_fixed_ip
}
