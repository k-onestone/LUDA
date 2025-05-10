terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

# 🔍 외부 public 네트워크 조회 (Floating IP 풀)
data "openstack_networking_network_v2" "public" {
  name = var.floating_pool_name
}

# ✅ bastion 인스턴스 생성
resource "openstack_compute_instance_v2" "bastion" {
  name            = var.name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.secgroup]

  network {
  uuid        = var.security_network_id
  fixed_ip_v4 = var.bastion_zone1_ip
}

  network {
  uuid        = var.zone1_network_id
  fixed_ip_v4 = var.zone1_fixed_ip
}

}

# ✅ Floating IP 발급
resource "openstack_networking_floatingip_v2" "bastion_fip" {
  pool = data.openstack_networking_network_v2.public.id
}

# ✅ Floating IP → bastion 인스턴스 연결
resource "openstack_compute_floatingip_associate_v2" "bastion_assoc" {
  floating_ip = openstack_networking_floatingip_v2.bastion_fip.address
  instance_id = openstack_compute_instance_v2.bastion.id
}
