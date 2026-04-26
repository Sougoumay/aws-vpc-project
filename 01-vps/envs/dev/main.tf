module "vpc" {
  source = "../../modules/vpc"

  pb_subnet_1_cidr_block = var.pb_subnet_1_cidr_block
  pb_subnet_2_cidr_block = var.pb_subnet_2_cidr_block
  pv_subnet_1_cidr_block = var.pv_subnet_1_cidr_block
  pv_subnet_2_cidr_block = var.pv_subnet_2_cidr_block
  cidr_block             = var.cidr_block
  az1                    = var.az1
  az2                    = var.az2
}
