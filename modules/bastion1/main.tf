terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_instance_v2" "bastion" {
  name            = var.name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
    uuid        = var.network_id_zone1
    fixed_ip_v4 = var.fixed_ip
  }
}

resource "openstack_networking_floatingip_v2" "bastion_fip" {
  pool = var.floating_network_id
}

resource "openstack_compute_floatingip_associate_v2" "bastion_assoc" {
  floating_ip = openstack_networking_floatingip_v2.bastion_fip.address
  instance_id = openstack_compute_instance_v2.bastion.id
}
