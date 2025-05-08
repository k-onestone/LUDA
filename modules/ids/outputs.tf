output "private_ip" {
  description = "IDS 인스턴스의 고정 IP"
  value       = openstack_compute_instance_v2.ids.access_ip_v4
}
