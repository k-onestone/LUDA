terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

# 1. Firewall Rule - HTTP 허용
resource "openstack_fw_rule_v2" "allow_http" {
  name              = "allow-http"
  action            = "allow"
  protocol          = "tcp"
  destination_port  = "80"
  enabled           = true
}

# 2. Firewall Rule - SSH 허용
resource "openstack_fw_rule_v2" "allow_ssh" {
  name              = "allow-ssh"
  action            = "allow"
  protocol          = "tcp"
  destination_port  = "22"
  enabled           = true
}

# 3. Firewall Rule - 기본 차단
resource "openstack_fw_rule_v2" "default_deny" {
  name    = "default-deny"
  action  = "deny"
  enabled = true
}

# 4. Firewall Policy
resource "openstack_fw_policy_v2" "web_policy" {
  name  = "web-policy"
  rules = [
    openstack_fw_rule_v2.allow_ssh.id,
    openstack_fw_rule_v2.allow_http.id,
    openstack_fw_rule_v2.default_deny.id
  ]
}

# 5. Firewall Group (라우터 인터페이스 포트에 적용)
resource "openstack_fw_group_v2" "main_fw_group" {
  name                = "main-fw-group"
  firewall_policy_id  = openstack_fw_policy_v2.web_policy.id
  ports               = [var.router_interface_port_id]
}
