variable "image_name" {
  description = "VPN 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "VPN 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "VPN 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "VPN 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "shared_network_id" {
  description = "VPN이 연결될 shared-net 네트워크 ID"
  type        = string
}

variable "security_network_id" {
  description = "VPN이 연결될 security-net 네트워크 ID"
  type        = string
}

variable "vpn_fixed_ip_shared" {
  description = "VPN shared-net 고정 IP"
  type        = string
}

variable "vpn_fixed_ip_security" {
  description = "VPN security-net 고정 IP"
  type        = string
}

variable "floating_pool_name" {
  description = "VPN 인스턴스에 할당할 Floating IP 풀 이름"
  type        = string
}
