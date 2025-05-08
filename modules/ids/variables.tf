variable "image_name" {
  description = "IDS 인스턴스에 사용할 이미지 이름"
  type        = string
}

variable "flavor_name" {
  description = "IDS 인스턴스에 사용할 Flavor 이름"
  type        = string
}

variable "key_pair" {
  description = "IDS 인스턴스에 사용할 Keypair 이름"
  type        = string
}

variable "secgroup" {
  description = "IDS 인스턴스에 적용할 보안 그룹 ID"
  type        = string
}

variable "network_id" {
  description = "IDS가 연결될 네트워크 ID"
  type        = string
}

variable "ids_fixed_ip" {
  description = "IDS 인스턴스에 할당할 고정 IP 주소"
  type        = string
}
