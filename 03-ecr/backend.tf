terraform {
  backend "s3" {
    bucket         = "infra-training-terraform-state"
    key            = "ecr/terraform.tfstate"        # ← change ici
    region         = "eu-west-3"
    dynamodb_table = "infra-training-terraform-lock-dynamo-db"               # même table pour tous
    encrypt        = true
  }
}