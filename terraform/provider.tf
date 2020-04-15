provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket="gepardec-terraform-state"
    region="us-east-1"
  }
}