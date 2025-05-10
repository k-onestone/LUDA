terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_instance_v2" "elk" {
  name            = "elk"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
    uuid        = var.shared_network_id
    fixed_ip_v4 = var.elk_fixed_ip_shared
  }

  network {
    uuid        = var.security_network_id
    fixed_ip_v4 = var.elk_fixed_ip_security
  }
 user_data = file("${path.module}/../cloud-init/elk.yaml")
}
