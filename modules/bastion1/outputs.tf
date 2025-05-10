output "bastion_instance_id" {
  description = "Bastion 인스턴스 ID"
  value       = openstack_compute_instance_v2.bastion.id
}

output "bastion_floating_ip" {
  description = "Bastion 인스턴스의 Floating IP 주소"
  value       = openstack_networking_floatingip_v2.bastion_fip.address
}

output "bastion_security_ip" {
  description = "Bastion 인스턴스의 security-net 고정 IP"
  value       = var.bastion_security_ip
}

output "bastion_zone1_ip" {
  description = "Bastion 인스턴스의 zone1-net 고정 IP"
  value       = var.bastion_zone1_ip
}
