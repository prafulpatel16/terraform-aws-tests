# Terraform Block
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.48.0"
    }
  }
  required_version = ">= 1.3.0"
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}