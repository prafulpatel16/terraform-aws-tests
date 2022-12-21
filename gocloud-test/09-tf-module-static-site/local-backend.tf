# Terraform Block
terraform {
  backend "local" {
    path = "local-statefile/terraform.tfstate" //local backend to store the state locally
  }
}