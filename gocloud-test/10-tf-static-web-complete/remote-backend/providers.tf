terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
  #  backend "s3"{}
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
