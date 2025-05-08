output "private_ip" {
  description = "IPS 인스턴스의 고정 IP"
  value       = openstack_compute_instance_v2.ips.access_ip_v4
}
