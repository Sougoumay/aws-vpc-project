output "registry_id" {
  value = aws_ecr_repository.infra_training_ecr.registry_id
}

output "repository_url" {
  value = aws_ecr_repository.infra_training_ecr.repository_url
}
