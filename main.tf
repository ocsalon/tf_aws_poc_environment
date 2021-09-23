// Creates VPC 
module "vpc" {
  source          = "./modules/vpc"
  vpc_create      = var.vpc_create
  create_igw      = var.create_igw
  vpc_cidr        = var.vpc_cidr
  vpc_ins_tenancy = var.vpc_ins_tenancy
  vpc_name        = var.vpc_name
  vpc_tags        = var.vpc_tags
  rtt_cidr        = var.rtt_cidr
  public_subnet_ids  = module.public_subnets.subnet_id
}

// Creates private subnets 
module "private_subnets" {
  source                  = "./modules/subnet"
  subnets                 = var.private_subnets
  sn_vpc_id               = module.vpc.vpc_id[0]
  sn_azs                  = var.sn_azs
  sn_tags                 = var.sn_tags
  map_public_ip_on_launch = var.is_public_subnet2
}

// Creates public subnets 
module "public_subnets" {
  source                  = "./modules/subnet"
  subnets                 = var.public_subnets
  sn_vpc_id               = module.vpc.vpc_id[0]
  sn_azs                  = var.sn_azs
  sn_tags                 = var.sn_tags
  map_public_ip_on_launch = var.is_public_subnet
} 

// Creates ALB
module "alb" {
  source = "./modules/alb"
  // Create SG
  sg_name                 = var.sg_name
  sg_description          = var.sg_description
  sg_vpc_id               = module.vpc.vpc_id[0]

  // create sg rule
  sg_rl_description = var.sg_rl_description 
  sg_type = var.sg_type
  sg_protocol =  var.sg_protocol
  sg_from_port = var.sg_from_port 
  sg_to_port = var.sg_to_port 
  sg_cidr = var.sg_cidr

  // create ALB
  alb_name = var.alb_name
  alb_internal = var.alb_internal
  alb_type = var.alb_type
  alb_sns = module.public_subnets.subnet_id

  // create ALB targetgroup
  tg_name = var.tg_name
  tg_port = var.tg_port
  tg_proto = var. tg_proto 
  tg_vpc_id = module.vpc.vpc_id[0]
  
  // create ALB listener
  lst_port              = var.lst_port
  lst_proto          = var.lst_proto 
  lst_dft_type  = var.lst_dft_type 
}


