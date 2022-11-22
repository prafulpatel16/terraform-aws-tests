# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
# AMI Variable
variable "ami" {
  description = "Variable for EC2 instance AMI"
  type        = string
  default     = "ami-0b0dcb5067f052a63"
}
# Instance Type variable
variable "instance_type" {
  description = "Variable for EC2 instance type"
  type        = string
  default     = "t2.micro"
}
# VPC variable
variable "vpc" {
  description = "Variable for VPC"
  type        = string
  default     = "vpc-04274fa8da3d32717"
}

 