terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "prafectlink2023"
    dynamodb_table = "prafect-terraform-locks"
    key            = "dev"
    region         = "us-east-1"
  }
}