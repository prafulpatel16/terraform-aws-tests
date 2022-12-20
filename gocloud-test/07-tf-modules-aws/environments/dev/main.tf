#--- root/main.tf ------

module "vpc" {
  source = "../../modules/vpc"
  #  vpc_cidr = var.vpc_cidr
  #  public_cidrs = ["10.123.2.0/24, 10.123.4.0/24"]

}

