terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_instance_v2" "ips" {
  name            = "ips"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
    uuid        = var.security_network_id
    fixed_ip_v4 = var.ips_fixed_ip
  }

  user_data = file("${path.module}/../cloud-init/ips.yaml")
}
