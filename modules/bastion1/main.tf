terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

# 외부 public 네트워크 조회 (Floating IP 풀 이름)
data "openstack_networking_network_v2" "public" {
  name = var.floating_pool_name
}

# Bastion 인스턴스 생성
resource "openstack_compute_instance_v2" "bastion" {
  name            = var.name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  # security-net
  network {
    uuid        = var.security_network_id
    fixed_ip_v4 = var.bastion_security_ip
  }

  # zone1-net
  network {
    uuid        = var.zone1_network_id
    fixed_ip_v4 = var.bastion_zone1_ip
  }
  user_data = file("${path.module}/../cloud-init/bastion1.yaml")
}

# Floating IP 발급
resource "openstack_networking_floatingip_v2" "bastion_fip" {
  pool = var.floating_pool_name
}

# Floating IP → Bastion 연결
resource "openstack_compute_floatingip_associate_v2" "bastion_assoc" {
  floating_ip = openstack_networking_floatingip_v2.bastion_fip.address
  instance_id = openstack_compute_instance_v2.bastion.id
}
