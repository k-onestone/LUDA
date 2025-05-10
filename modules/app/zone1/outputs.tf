output "zone1_instance_id" {
  description = "Zone1 인스턴스 ID"
  value       = openstack_compute_instance_v2.zone1.id
}

output "zone1_fixed_ip" {
  description = "Zone1 인스턴스의 고정 IP (Private)"
  value       = var.zone1_fixed_ip
}
