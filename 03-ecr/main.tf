resource "aws_ecr_repository" "infra_training_ecr" {
  name                 = "infra_training_ecr"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
  force_delete         = true
  

  image_tag_mutability_exclusion_filter {
    filter      = "latest*"
    filter_type = "WILDCARD"
  }

  image_tag_mutability_exclusion_filter {
    filter      = "dev-*"
    filter_type = "WILDCARD"
  }

  encryption_configuration {
    encryption_type = var.encryption_type
  }

  tags = {
    Name = "infra_training_ecr_tag"
  }
}