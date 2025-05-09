variable "name" {
  description = "Bastion 인스턴스 이름"
  type        = string
}

variable "image_name" {
  description = "Bastion 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "Bastion 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "Bastion 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "public_key_path" {
  description = "(선택적) Public key 경로"
  type        = string
  default     = ""
}

variable "secgroup" {
  description = "Bastion 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "network_id_zone1" {
  description = "Zone1 네트워크 ID"
  type        = string
}

variable "floating_pool_name" {
  description = "Floating IP를 할당할 외부 네트워크 이름"
  type        = string
}

variable "bastion_subnet_cidr" {
  description = "Bastion이 위치한 subnet CIDR"
  type        = string
}

variable "fixed_ip" {
  description = "Bastion 인스턴스 고정 IP"
  type        = string
}
