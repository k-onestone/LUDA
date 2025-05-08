output "fw_group_id" {
  description = "ID of the firewall group"
  value       = openstack_fw_group_v2.main_fw_group.id
}