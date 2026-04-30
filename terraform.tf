terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }

  # Remote backend for s3 and dynamodb

  backend "s3" {
    bucket         = "backend-remote-bucket-12345"
    key            = "Terra-Project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "backend-remote-table"
    use_lockfile   = true



  }
}