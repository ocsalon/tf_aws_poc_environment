module "vpc" {
  source           = "./modules/vpc"
  create_vpc       = true
  cidr             = "10.1.0.0/16"
  instance_tenancy = "default"
  name             = "prod_vpc"
  tags = {
    Project     = "cf-tc",
    Environment = "PoC"
  }
}