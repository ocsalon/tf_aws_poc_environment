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
  // Create ALB SG
  sg_name                 = var.sg_name
  sg_description          = var.sg_description
  sg_vpc_id               = module.vpc.vpc_id[0]

  // create ALB sg rule
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
  alb_sns = module.private_subnets.subnet_id

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

// create ASG instance security group
module "asg-sg" {
  source                  = "./modules/sg"
  sg_name                 = var.asg_sg_name
  sg_description          = var.asg_sg_description
  sg_vpc_id               = module.vpc.vpc_id[0]
}
// create sg rule
module "asg-sg-rule" {
  source = "./modules/sg_rule"
  sg_id = module.asg-sg.sg_id
  sg_rl_description = var.asg_sg_rl_description 
  sg_type = var.asg_sg_type
  sg_protocol =  var.asg_sg_protocol
  sg_from_port = var.asg_sg_from_port 
  sg_to_port = var.asg_sg_to_port 
  sg_cidr = var.asg_sg_cidr
}

module "asg" {
  source = "./modules/asg"
  plg_name = var.plg_name
  plg_strategy = var.plg_strategy
  asg_sn_id = [module.private_subnets.subnet_id[1]]
  asg_desired_cap = var.asg_desired_cap
  asg_min_size = var.asg_min_size
  asg_max_size = var.asg_max_size
  lt_version = var.lt_version
  lt_name = var.lt_name
  lt_blk_dev_name = var.lt_blk_dev_name
  lt_blk_vol_size = var.lt_blk_vol_size
  lt_ami_id = var.lt_ami_id
  lt_shutdown_behav = var.lt_shutdown_behav
  lt_instance_type = var.lt_instance_type
  lt_az = var.lt_az
  lt_sgs = [module.asg-sg.sg_id]
  tag_resource_type = var.tag_resource_type
  tag_name = var.tag_name
  key_name = var.key_name
}
