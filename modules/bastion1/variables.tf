variable "name" {
  description = "Bastion 인스턴스 이름"
  type        = string
}

variable "image_name" {
  description = "이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "SSH Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "보안 그룹 ID"
  type        = string
}

variable "security_network_id" {
  description = "security-net 네트워크 ID"
  type        = string
}

variable "zone1_network_id" {
  description = "zone1-net 네트워크 ID"
  type        = string
}

variable "bastion_zone1_ip" {
  description = "security-net 상의 Bastion 고정 IP"
  type        = string
}

variable "zone1_fixed_ip" {
  description = "zone1-net 상의 Bastion 고정 IP"
  type        = string
}

variable "floating_pool_name" {
  description = "Floating IP 풀 이름 (예: public)"
  type        = string
}
