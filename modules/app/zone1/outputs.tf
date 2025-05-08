output "private_ip" {
  description = "Zone1 인스턴스의 고정 IP"
  value       = openstack_compute_instance_v2.zone1.access_ip_v4
}
