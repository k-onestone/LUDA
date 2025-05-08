variable "image_name" {
  description = "ELK 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "ELK 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "ELK 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "ELK 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "shared_network_id" {
  description = "ELK가 연결될 shared 네트워크 ID"
  type        = string
}

variable "security_network_id" {
  description = "ELK가 연결될 security 네트워크 ID"
  type        = string
}

variable "elk_fixed_ip_shared" {
  description = "ELK의 shared-net 고정 IP"
  type        = string
}

variable "elk_fixed_ip_security" {
  description = "ELK의 security-net 고정 IP"
  type        = string
}
