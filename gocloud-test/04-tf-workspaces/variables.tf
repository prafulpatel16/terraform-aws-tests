variable "instance_type" {
  type = map(any)
  default = {
    "dev"  = "t3.micro"
    "prod" = "t1.micro"
  }
}
