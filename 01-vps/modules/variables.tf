variable "cidr_block" {
  type = string
  description = "VPS CIDR_BLOCK"
}

variable "pb_subnet_1_cidr_block" {
  type = string
  description = "Public subnet 1 CIDR_BLOCK"
}

variable "pb_subnet_2_cidr_block" {
  type = string
  description = "Public subnet 2 CIDR_BLOCK"
}

variable "pv_subnet_1_cidr_block" {
  type = string
  description = "Private subnet 1 CIDR_BLOCK"
}

variable "pv_subnet_2_cidr_block" {
  type = string
  description = "Private subnet 2 CIDR_BLOCK"
}

variable "az1" {
  type = string
  description = "Availability zone 1 in the region"
}

variable "az2" {
  type = string
  description = "Availability zone 2 in the region"
}

