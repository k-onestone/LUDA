output "ids_instance_id" {
  description = "IDS 인스턴스 ID"
  value       = openstack_compute_instance_v2.ids.id
}

output "ids_fixed_ip" {
  description = "IDS 인스턴스 고정 IP"
  value       = var.ids_fixed_ip
}
