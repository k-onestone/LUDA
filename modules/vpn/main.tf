terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_instance_v2" "vpn" {
  name            = "vpn"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
    uuid        = var.shared_network_id
    fixed_ip_v4 = var.vpn_fixed_ip_shared
  }

  network {
    uuid        = var.security_network_id
    fixed_ip_v4 = var.vpn_fixed_ip_security
  }
}

resource "openstack_networking_floatingip_v2" "vpn_fip" {
  pool = var.floating_pool_name
}

resource "openstack_compute_floatingip_associate_v2" "vpn_assoc" {
  floating_ip = openstack_networking_floatingip_v2.vpn_fip.address
  instance_id = openstack_compute_instance_v2.vpn.id
}
