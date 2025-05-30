auth_url            = "http://192.168.110.100/identity/v3"
tenant_name         = "admin"
user_name           = "admin"
password            = "secret"
region              = "RegionOne"
user_domain_name    = "Default"
project_domain_name = "Default"

image_name          = "Ubuntu 22.04"
key_pair            = "luda-key"
public_key_path     = "/opt/stack/.ssh/id_rsa.pub"

flavor_name_small   = "m1.small"
flavor_name_medium  = "m1.medium"
flavor_name_large   = "m1.large"

floating_network_name = "public"
floating_network_id   = "public"

public_subnet_cidr       = "192.168.55.0/24"
public_gateway           = "192.168.55.1"
public_pool_start        = "192.168.55.101"
public_pool_end          = "192.168.55.110"

zone1_subnet_cidr        = "10.0.0.0/24"
shared_subnet_cidr       = "192.168.233.0/24"
security_subnet_cidr     = "10.10.10.0/24"
bastion_zone1_subnet_cidr = "10.0.0.0/24"

bastion_security_ip = "10.10.10.250"
bastion_zone1_ip = "10.0.0.250"
zone1_fixed_ip   = "10.0.0.100"
elk_fixed_ip_shared      = "192.168.233.200"
elk_fixed_ip_security    = "10.10.10.200"
vpn_fixed_ip_shared      = "192.168.233.100"
vpn_fixed_ip_security    = "10.10.10.100"
ids_fixed_ip             = "10.10.10.10"
ips_fixed_ip             = "10.10.10.11"
waf_fixed_ip             = "10.10.10.12"
vpn_subnet_cidr          = "172.16.0.0/24"
vpn_fixed_ip_vpn         = "172.16.0.100"
vpn_network_name         = "vpn-net"
