terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
backend "s3" {
    encrypt        = true
    bucket         = "prafectlink2023"
    dynamodb_table = "prafect-terraform-locks"
    key            = "prafect/dev/terraform.tfstate"
    region         = "us-east-1"
  }
  /*
provider "aws" {
  region = "us-east-1"
}
*/
}