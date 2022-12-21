# Terraform Block
terraform {
  backend "local" {
    path = "static-web-statefile/terraform.tfstate" //local backend to store the state locally
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}