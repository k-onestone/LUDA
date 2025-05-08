variable "image_name" {
  description = "WAF 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "WAF 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "WAF 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "WAF 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "security_network_id" {
  description = "WAF가 연결될 security-net 네트워크 ID"
  type        = string
}

variable "zone1_network_id" {
  description = "WAF가 연결될 zone1-net 네트워크 ID"
  type        = string
}

variable "waf_fixed_ip" {
  description = "WAF 인스턴스의 security-net 고정 IP"
  type        = string
}
