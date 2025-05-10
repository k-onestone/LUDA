output "security_fw_group_id" {
  description = "보안용 방화벽 그룹 ID"
  value       = openstack_networking_fwaas_v2_firewall_group_v2.security_fw.id
}

output "security_fw_policy_id" {
  description = "방화벽 정책 ID"
  value       = openstack_networking_fwaas_v2_firewall_policy_v2.security_policy.id
}