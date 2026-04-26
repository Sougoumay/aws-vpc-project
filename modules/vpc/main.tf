resource "aws_vpc" "infra_training_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "infra_training_vpc_tag"
  }
}

resource "aws_subnet" "infra_training_pb_subnet_1" {
  vpc_id                    = aws_vpc.infra_training_vpc.id
  cidr_block                = var.pb_subnet_1_cidr_block
  availability_zone_id      =   var.az1
  map_public_ip_on_launch   = true
  
  tags = {
    Name                    = "infra_training_pb_subnet_1_tag"
  }
}

resource "aws_subnet" "infra_training_pb_subnet_2" {
  vpc_id                    = aws_vpc.infra_training_vpc.id
  cidr_block                = var.pb_subnet_2_cidr_block
  availability_zone_id      =   var.az2
  map_public_ip_on_launch   = true
  
  tags = {
    Name                    = "infra_training_pb_subnet_2_tag"
  }
}

resource "aws_internet_gateway" "infra_training_gw" {
  vpc_id = aws_vpc.infra_training_vpc.id

  tags = {
    Name = "infra_training_gw_tag"
  }
}

resource "aws_route_table" "infra_training_pb_route_table" {
  vpc_id = aws_vpc.infra_training_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.infra_training_gw.id
  }

  tags = {
    Name = "infra_training_pb_route_table_tag"
  }
}

resource "aws_route_table_association" "infra_training_pb_route_table_association_pb_subnet_1" {
  subnet_id      = aws_subnet.infra_training_pb_subnet_1.id
  route_table_id = aws_route_table.infra_training_pb_route_table.id
}

resource "aws_route_table_association" "infra_training_pb_route_table_association_pb_subnet_2" {
  subnet_id      = aws_subnet.infra_training_pb_subnet_2.id
  route_table_id = aws_route_table.infra_training_pb_route_table.id
}

resource "aws_subnet" "infra_training_pv_subnet_1" {
  vpc_id                    = aws_vpc.infra_training_vpc.id
  cidr_block                = var.pv_subnet_1_cidr_block
  availability_zone_id      =   var.az1
  map_public_ip_on_launch   = false
  
  tags = {
    Name                    = "infra_training_pv_subnet_1_tag"
  }
}

resource "aws_subnet" "infra_training_pv_subnet_2" {
  vpc_id                    = aws_vpc.infra_training_vpc.id
  cidr_block                = var.pv_subnet_2_cidr_block
  availability_zone_id      =   var.az2
  map_public_ip_on_launch   = false
  
  tags = {
    Name                    = "infra_training_pv_subnet_2_tag"
  }
}

resource "aws_eip" "infra_training_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "infra_training_nat_eip_tag"
  }
}

resource "aws_nat_gateway" "infra_training_nat_gateway_subnet_1" {
  subnet_id     = aws_subnet.infra_training_pb_subnet_1.id
  allocation_id = aws_eip.infra_training_nat_eip.id
  availability_mode = "zonal"
  connectivity_type = "public"

  tags = {
    Name = "infra_training_nat_gateway_subnet_1_tag"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.infra_training_gw]
}

resource "aws_route_table" "infra_training_pv_route_table" {
  vpc_id = aws_vpc.infra_training_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.infra_training_nat_gateway_subnet_1.id
  }

  tags = {
    Name = "infra_training_pv_route_table_tag"
  }
}

resource "aws_route_table_association" "infra_training_pb_route_table_association_pv_subnet_1" {
  subnet_id      = aws_subnet.infra_training_pv_subnet_1.id
  route_table_id = aws_route_table.infra_training_pv_route_table.id
}

resource "aws_route_table_association" "infra_training_pb_route_table_association_pv_subnet_2" {
  subnet_id      = aws_subnet.infra_training_pv_subnet_2.id
  route_table_id = aws_route_table.infra_training_pv_route_table.id
}