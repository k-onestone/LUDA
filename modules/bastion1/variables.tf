variable "name" {
  description = "Bastion 인스턴스 이름"
  type        = string
}

variable "image_name" {
  type = string
}

variable "flavor_name" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "secgroup" {
  type = string
}

variable "security_network_id" {
  type = string
}

variable "zone1_network_id" {
  type = string
}

variable "bastion_security_ip" {
  description = "security-net 상 Bastion 고정 IP"
  type        = string
}

variable "bastion_zone1_ip" {
  description = "zone1-net 상 Bastion 고정 IP"
  type        = string
}

variable "floating_pool_name" {
  type = string
}

variable "public_key_path" {
  description = "SSH 공개키 경로 (선택사항)"
  type        = string
  default     = ""
}
