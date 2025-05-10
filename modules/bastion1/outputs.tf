output "bastion1_fixed_ip" {
  value = var.bastion1_external_ip
}

output "bastion1_floating_ip" {
  value = openstack_networking_floatingip_v2.bastion_fip.address
}
