output "vpc_id" {
  value = aws_vpc.infra_training_vpc.id
}

output "pb_subnet_1_id" {
  value = aws_subnet.infra_training_pb_subnet_1.id
}

output "pb_subnet_2_id" {
  value = aws_subnet.infra_training_pb_subnet_2.id
}

output "pv_subnet_1_id" {
  value = aws_subnet.infra_training_pv_subnet_1.id
}

output "pv_subnet_2_id" {
  value = aws_subnet.infra_training_pv_subnet_2.id
}
