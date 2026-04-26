variable "region" {
    type = string
    description = "AWS region name"
}

variable "cidr_block" {
  type = string
  description = "VPS CIDR_BLOCK"
}

variable "pb_subnet_1_cidr_block" {
  type        = string
  description = "Public subnet 1 CIDR block"
}

variable "pb_subnet_2_cidr_block" {
  type        = string
  description = "Public subnet 2 CIDR block"
}

variable "pv_subnet_1_cidr_block" {
  type        = string
  description = "Private subnet 1 CIDR block"
}

variable "pv_subnet_2_cidr_block" {
  type        = string
  description = "Private subnet 2 CIDR block"
}

variable "az1" {
  type        = string
  description = "Availability zone 1"
}

variable "az2" {
  type        = string
  description = "Availability zone 2"
}
