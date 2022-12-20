# Terraform Block
terraform {
  backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "prafect"

         # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
           name = "terraform-aws-tests"
        }
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