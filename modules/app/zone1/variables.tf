variable "name" {
  description = "Zone1 인스턴스 이름"
  type        = string
}

variable "image_name" {
  description = "Zone1 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "Zone1 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "Zone1 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "Zone1 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "network_id" {
  description = "Zone1 인스턴스가 연결될 네트워크 ID"
  type        = string
}

variable "zone1_fixed_ip" {
  description = "Zone1 인스턴스에 할당할 고정 IP"
  type        = string
}

variable "public_key_path" {
  description = "SSH 공개키 경로"
  type        = string
}