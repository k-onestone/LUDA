terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}


# Bastion 보안 그룹

resource "openstack_networking_secgroup_v2" "bastion_sg" {
  name        = "bastion-secgroup"
  description = "Bastion 호스트용 보안 그룹"
}

resource "openstack_networking_secgroup_rule_v2" "bastion_allow_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.bastion_sg.id
}


# App (zone1) 보안 그룹

resource "openstack_networking_secgroup_v2" "app_sg" {
  name        = "app-secgroup"
  description = "Zone1 애플리케이션 서버용 보안 그룹"
}

resource "openstack_networking_secgroup_rule_v2" "app_allow_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.app_sg.id
}


# VPN 서버 보안 그룹

resource "openstack_networking_secgroup_v2" "vpn_secgroup" {
  name        = "vpn-secgroup"
  description = "VPN 서버용 보안 그룹"
}

resource "openstack_networking_secgroup_rule_v2" "vpn_udp_500" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 500
  port_range_max    = 500
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.vpn_secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "vpn_udp_4500" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 4500
  port_range_max    = 4500
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.vpn_secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "vpn_allow_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.vpn_secgroup.id
}

# ELK 서버 보안 그룹
resource "openstack_networking_secgroup_v2" "elk_sg" {
  name        = "elk-secgroup"
  description = "Security group for ELK server"
}

resource "openstack_networking_secgroup_rule_v2" "elk_allow_filebeat" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5044
  port_range_max    = 5044
  remote_ip_prefix  = "10.10.10.0/24"
  security_group_id = openstack_networking_secgroup_v2.elk_sg.id
}

resource "openstack_networking_secgroup_rule_v2" "elk_allow_dashboard" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8000
  port_range_max    = 8000
  remote_ip_prefix  = "192.168.233.100"
  security_group_id = openstack_networking_secgroup_v2.elk_sg.id
}

resource "openstack_networking_secgroup_rule_v2" "elk_allow_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.233.100"
  security_group_id = openstack_networking_secgroup_v2.elk_sg.id
}

resource "openstack_networking_secgroup_rule_v2" "elk_allow_egress" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = null
  security_group_id = openstack_networking_secgroup_v2.elk_sg.id
}

# IDS / IPS / WAF 보안 그룹 (기본 허용)

resource "openstack_networking_secgroup_v2" "ids_sg" {
  name        = "ids-secgroup"
  description = "IDS 장비용 보안 그룹"
}

resource "openstack_networking_secgroup_v2" "ips_sg" {
  name        = "ips-secgroup"
  description = "IPS 장비용 보안 그룹"
}

resource "openstack_networking_secgroup_v2" "waf_sg" {
  name        = "waf-secgroup"
  description = "WAF 장비용 보안 그룹"
}
