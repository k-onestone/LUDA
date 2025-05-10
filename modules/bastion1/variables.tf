variable "name" {
  description = "Bastion 인스턴스 이름"
  type        = string
}

variable "image_name" {
  description = "Bastion에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "Bastion에 사용할 Flavor"
  type        = string
}

variable "key_pair" {
  description = "SSH 키페어 이름"
  type        = string
}

variable "secgroup" {
  description = "보안 그룹 ID"
  type        = string
}

variable "security_network_id" {
  description = "보안 네트워크 ID (security-net)"
  type        = string
}

variable "zone1_network_id" {
  description = "Zone1 네트워크 ID"
  type        = string
}

variable "bastion1_external_ip" {
  description = "security-net에서 사용할 bastion 고정 IP"
  type        = string
}

variable "bastion1_internal_ip" {
  description = "zone1-net에서 사용할 bastion 고정 IP"
  type        = string
}

variable "floating_pool_name" {
  description = "Floating IP를 할당할 외부 네트워크 이름"
  type        = string
}
