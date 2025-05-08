output "private_ip_security" {
  description = "WAF 인스턴스의 security-net 고정 IP"
  value       = var.waf_fixed_ip
}

output "zone1_interface_ip" {
  description = "WAF 인스턴스의 zone1-net 인터페이스 IP (DHCP 할당)"
  value       = openstack_compute_instance_v2.waf.network[1].fixed_ip_v4
}
