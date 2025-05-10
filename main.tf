terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  auth_url            = var.auth_url
  tenant_name         = var.tenant_name
  user_name           = var.user_name
  password            = var.password
  region              = var.region
  user_domain_name    = var.user_domain_name
  project_domain_name = var.project_domain_name
}

module "network" {
  source    = "./modules/network"
  providers = { openstack = openstack }

  public_subnet_cidr     = var.public_subnet_cidr
  public_gateway         = var.public_gateway
  public_pool_start      = var.public_pool_start
  public_pool_end        = var.public_pool_end
  zone1_subnet_cidr      = var.zone1_subnet_cidr
  shared_subnet_cidr     = var.shared_subnet_cidr
  security_subnet_cidr   = var.security_subnet_cidr
  vpn_subnet_cidr        = var.vpn_subnet_cidr
}

module "secgroup" {
  source    = "./modules/security-group"
  providers = { openstack = openstack }
}

module "vpn" {
  source                = "./modules/vpn"
  providers             = { openstack = openstack }
  image_name            = var.image_name
  flavor_name           = var.flavor_name_small
  key_pair              = var.key_pair
  secgroup              = module.secgroup.vpn_secgroup_id
  security_network_id   = module.network.security_net_id
  shared_network_id     = module.network.shared_network_id
  vpn_network_name      = var.vpn_network_name
  vpn_fixed_ip_vpn      = var.vpn_fixed_ip_vpn
  vpn_fixed_ip_security = var.vpn_fixed_ip_security
  vpn_fixed_ip_shared   = var.vpn_fixed_ip_shared
  floating_pool_name    = var.floating_network_name
}

module "bastion1" {
  source               = "./modules/bastion1"
  providers            = { openstack = openstack }
  name                 = "bastion1"
  image_name           = var.image_name
  flavor_name          = var.flavor_name_small
  key_pair             = var.key_pair
  public_key_path      = var.public_key_path
  secgroup             = module.secgroup.bastion_sg_id
  security_network_id  = module.network.security_net_id
  zone1_network_id     = module.network.zone1_net_id
  bastion1_external_ip = var.bastion_zone1_ip
  bastion1_internal_ip = var.zone1_fixed_ip
  floating_pool_name   = var.floating_network_name
}

module "zone1" {
  source            = "./modules/app/zone1"
  providers         = { openstack = openstack }
  name              = "zone1"
  image_name        = var.image_name
  flavor_name       = var.flavor_name_small
  key_pair          = var.key_pair
  public_key_path   = var.public_key_path
  secgroup          = module.secgroup.app_sg_id
  network_id        = module.network.zone1_net_id
  zone1_fixed_ip    = var.zone1_fixed_ip
}

module "elk" {
  source                = "./modules/elk"
  providers             = { openstack = openstack }
  image_name            = var.image_name
  flavor_name           = var.flavor_name_large
  key_pair              = var.key_pair
  secgroup              = module.secgroup.elk_sg_id
  shared_network_id     = module.network.shared_network_id
  security_network_id   = module.network.security_net_id
  elk_fixed_ip_shared   = var.elk_fixed_ip_shared
  elk_fixed_ip_security = var.elk_fixed_ip_security
}

module "ids" {
  source        = "./modules/ids"
  providers     = { openstack = openstack }
  image_name    = var.image_name
  flavor_name   = var.flavor_name_medium
  key_pair      = var.key_pair
  secgroup      = module.secgroup.ids_sg_id
  network_id    = module.network.security_net_id
  ids_fixed_ip  = var.ids_fixed_ip
}

module "ips" {
  source              = "./modules/ips"
  providers           = { openstack = openstack }
  image_name          = var.image_name
  flavor_name         = var.flavor_name_small
  key_pair            = var.key_pair
  secgroup            = module.secgroup.ips_sg_id
  security_network_id = module.network.security_net_id
  ips_fixed_ip        = var.ips_fixed_ip
}

module "waf" {
  source              = "./modules/waf"
  providers           = { openstack = openstack }
  image_name          = var.image_name
  flavor_name         = var.flavor_name_small
  key_pair            = var.key_pair
  secgroup            = module.secgroup.waf_sg_id
  security_network_id = module.network.security_net_id
  waf_fixed_ip        = var.waf_fixed_ip
  zone1_network_id    = module.network.zone1_net_id
}