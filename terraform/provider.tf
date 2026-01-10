terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "devops-bootcamp-terraform-safwan"
    key    = "devops-bootcamp/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = {
      Project     = "DevOps-Bootcamp-Final-Project"
      ManagedBy   = "Terraform"
      Environment = "Production"
    }
  }
}
