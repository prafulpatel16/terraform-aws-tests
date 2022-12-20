variable "aws_region" {
  description = "Value of the regions"
  type        = string
  default     = "us-east-1"
}
variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}