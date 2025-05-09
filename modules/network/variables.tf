variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
}

variable "public_gateway" {
  description = "Gateway IP for public subnet"
  type        = string
}

variable "public_pool_start" {
  description = "Start IP for public floating IP pool"
  type        = string
}

variable "public_pool_end" {
  description = "End IP for public floating IP pool"
  type        = string
}

variable "security_subnet_cidr" {
  description = "CIDR for security subnet"
  type        = string
}

variable "zone1_subnet_cidr" {
  description = "CIDR for zone1 subnet"
  type        = string
}

variable "shared_subnet_cidr" {
  description = "CIDR for shared subnet"
  type        = string
}
