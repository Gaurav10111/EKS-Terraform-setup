terraform {
  required_version = ">= 1.9.3, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "mern-eks-tfstate-ap-south-1-20250812"
    region         = "ap-south-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "mern-eks-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
