output "bastion_sg_id" {
  value       = openstack_networking_secgroup_v2.bastion_sg.id
  description = "Bastion 보안 그룹 ID"
}

output "app_sg_id" {
  value       = openstack_networking_secgroup_v2.app_sg.id
  description = "App 서버 보안 그룹 ID"
}

output "vpn_secgroup_id" {
  value       = openstack_networking_secgroup_v2.vpn_secgroup.id
  description = "VPN 보안 그룹 ID"
}

output "elk_sg_id" {
  value       = openstack_networking_secgroup_v2.elk_sg.id
  description = "ELK 보안 그룹 ID"
}

output "ids_sg_id" {
  value       = openstack_networking_secgroup_v2.ids_sg.id
  description = "IDS 보안 그룹 ID"
}

output "ips_sg_id" {
  value       = openstack_networking_secgroup_v2.ips_sg.id
  description = "IPS 보안 그룹 ID"
}

output "waf_sg_id" {
  value       = openstack_networking_secgroup_v2.waf_sg.id
  description = "WAF 보안 그룹 ID"
}
