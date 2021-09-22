module "vpc" {
  source           = "./modules/vpc"
  vpc_create       = var.vpc_create
  vpc_cidr            = var.vpc_cidr
  vpc_ins_tenancy = var.vpc_ins_tenancy
 vpc_name           = var.vpc_name
  vpc_tags           = var.vpc_tags
}


module "private_subnets" {
  source = "./modules/subnet"
subnets = var.private_subnets
sn_vpc_id = module.vpc.vpc_id[0]
sn_azs = var.sn_azs
sn_tags = var.sn_tags



} 