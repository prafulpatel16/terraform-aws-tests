# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
resource "aws_key_pair" "terraform-key" {

  key_name = "terraform-key"

  public_key = file("private-key/terraform-key.pub")

}


# Show the key pair name as a result on the screen

output "keypair_name" {

  value = aws_key_pair.terraform-key.key_name

}