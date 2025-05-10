terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

resource "openstack_compute_instance_v2" "ids" {
  name            = "ids"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
    uuid        = var.network_id
    fixed_ip_v4 = var.ids_fixed_ip
  }
}
