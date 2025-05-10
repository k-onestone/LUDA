terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.49.0"
    }
  }
}

# ✅ 보안 라우터 포트 조회 (security-net 연결된 인터페이스)
data "openstack_networking_port_v2" "security_router_port" {
  name = "main-router:security-subnet"
}

# ✅ SSH 허용 룰
resource "openstack_networking_fwaas_v2_firewall_rule_v2" "allow_ssh" {
  name            = "allow-ssh"
  action          = "allow"
  protocol        = "tcp"
  destination_port= "22"
  enabled         = true
}

# ✅ VPN 포트 허용 (UDP 500, 4500)
resource "openstack_networking_fwaas_v2_firewall_rule_v2" "allow_vpn_500" {
  name            = "allow-vpn-500"
  action          = "allow"
  protocol        = "udp"
  destination_port= "500"
  enabled         = true
}

resource "openstack_networking_fwaas_v2_firewall_rule_v2" "allow_vpn_4500" {
  name            = "allow-vpn-4500"
  action          = "allow"
  protocol        = "udp"
  destination_port= "4500"
  enabled         = true
}

# ✅ 기본 차단 룰
resource "openstack_networking_fwaas_v2_firewall_rule_v2" "deny_all" {
  name     = "deny-all"
  action   = "deny"
  enabled  = true
}

# ✅ 정책 정의 (순서대로 처리됨)
resource "openstack_networking_fwaas_v2_firewall_policy_v2" "security_policy" {
  name  = "security-fw-policy"
  rules = [
    openstack_networking_fwaas_v2_firewall_rule_v2.allow_ssh.id,
    openstack_networking_fwaas_v2_firewall_rule_v2.allow_vpn_500.id,
    openstack_networking_fwaas_v2_firewall_rule_v2.allow_vpn_4500.id,
    openstack_networking_fwaas_v2_firewall_rule_v2.deny_all.id
  ]
}

# ✅ 방화벽 그룹 생성 (Router 인터페이스 포트에 바인딩)
resource "openstack_networking_fwaas_v2_firewall_group_v2" "security_fw" {
  name                         = "security-fw-group"
  ingress_firewall_policy_id  = openstack_networking_fwaas_v2_firewall_policy_v2.security_policy.id
  egress_firewall_policy_id   = openstack_networking_fwaas_v2_firewall_policy_v2.security_policy.id
  ports                        = [data.openstack_networking_port_v2.security_router_port.id]
  admin_state_up               = true
}
