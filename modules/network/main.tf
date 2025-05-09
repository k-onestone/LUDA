terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

# ✅ 외부 public 네트워크는 기존 리소스를 data로 참조
data "openstack_networking_network_v2" "public" {
  name = "public"
}

# 외부 subnet 정의만 새로 생성
resource "openstack_networking_subnet_v2" "public" {
  name            = "public-subnet"
  network_id      = data.openstack_networking_network_v2.public.id
  cidr            = var.public_subnet_cidr
  ip_version      = 4
  gateway_ip      = var.public_gateway

  allocation_pool {
    start = var.public_pool_start
    end   = var.public_pool_end
  }

  enable_dhcp = false
}

# 보안 장비 네트워크 (security-net)
resource "openstack_networking_network_v2" "security" {
  name           = "security-net"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "security" {
  name       = "security-subnet"
  network_id = openstack_networking_network_v2.security.id
  cidr       = var.security_subnet_cidr
  ip_version = 4
}

# 앱 서버 네트워크 (zone1-net)
resource "openstack_networking_network_v2" "zone1" {
  name           = "zone1-net"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "zone1" {
  name       = "zone1-subnet"
  network_id = openstack_networking_network_v2.zone1.id
  cidr       = var.zone1_subnet_cidr
  ip_version = 4
}

# 관리자용 내부망 (shared-net)
resource "openstack_networking_network_v2" "shared" {
  name           = "shared-net"
  admin_state_up = true
  shared         = true
}

resource "openstack_networking_subnet_v2" "shared" {
  name       = "shared-subnet"
  network_id = openstack_networking_network_v2.shared.id
  cidr       = var.shared_subnet_cidr
  ip_version = 4
}

# 라우터 (security-net만 연결)
resource "openstack_networking_router_v2" "main" {
  name                = "main-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public.id
}

resource "openstack_networking_router_interface_v2" "security_if" {
  router_id = openstack_networking_router_v2.main.id
  subnet_id = openstack_networking_subnet_v2.security.id
}