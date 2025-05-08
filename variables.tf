variable "auth_url" {
  type        = string
  description = "OpenStack 인증 URL"
}

variable "tenant_name" {
  type        = string
  description = "OpenStack 프로젝트 이름"
}

variable "user_name" {
  type        = string
  description = "OpenStack 사용자 이름"
}

variable "password" {
  type        = string
  description = "OpenStack 사용자 비밀번호"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "OpenStack Region"
}

variable "user_domain_name" {
  type        = string
  default     = "Default"
  description = "사용자 도메인 이름"
}

variable "project_domain_name" {
  type        = string
  default     = "Default"
  description = "프로젝트 도메인 이름"
}

variable "image_name" {
  type        = string
  description = "인스턴스에 사용할 이미지 이름"
}

variable "key_pair" {
  type        = string
  description = "OpenStack에 등록된 Keypair 이름"
}

variable "public_key_path" {
  type        = string
  description = "SSH 공개키 파일 경로"
}

variable "flavor_name_small" {
  type        = string
  description = "소형 인스턴스에 사용할 flavor 이름"
}

variable "flavor_name_medium" {
  type        = string
  description = "중형 인스턴스에 사용할 flavor 이름"
}

variable "flavor_name_large" {
  type        = string
  description = "대형 인스턴스에 사용할 flavor 이름"
}

variable "floating_network_name" {
  type        = string
  description = "Floating IP를 할당할 외부 네트워크 이름"
}

variable "floating_network_id" {
  type        = string
  description = "Floating IP를 할당할 외부 네트워크 ID"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR"
}

variable "public_gateway" {
  type        = string
  description = "Public subnet gateway"
}

variable "public_pool_start" {
  type        = string
  description = "Floating IP 풀 시작 주소"
}

variable "public_pool_end" {
  type        = string
  description = "Floating IP 풀 끝 주소"
}

variable "zone1_subnet_cidr" {
  type        = string
}

variable "shared_subnet_cidr" {
  type        = string
}

variable "security_subnet_cidr" {
  type        = string
}

variable "bastion_zone1_subnet_cidr" {
  type        = string
}

variable "zone1_fixed_ip" {
  type        = string
}

variable "bastion_zone1_ip" {
  type        = string
}

variable "elk_fixed_ip_shared" {
  type        = string
}

variable "elk_fixed_ip_security" {
  type        = string
}

variable "vpn_fixed_ip_shared" {
  type        = string
}

variable "vpn_fixed_ip_security" {
  type        = string
}

variable "ids_fixed_ip" {
  type        = string
}

variable "ips_fixed_ip" {
  type        = string
}

variable "waf_fixed_ip" {
  type        = string
}
