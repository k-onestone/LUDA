output "private_ip" {
  description = "Bastion 인스턴스의 고정 IP"
  value       = openstack_compute_instance_v2.bastion.access_ip_v4
}

output "floating_ip" {
  description = "Bastion 인스턴스의 Floating IP"
  value       = openstack_networking_floatingip_v2.bastion_fip.address
}
