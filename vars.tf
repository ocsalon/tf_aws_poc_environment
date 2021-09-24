variable "vpc_create" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "create_igw" {
 type = bool
 default = false  
}

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_ins_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}


variable "private_subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}


variable "sn_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "sn_vpc_id" {
  description = "VPC ID to associate to this subnet"
  type        = string
  default     = ""
}

variable "is_public_subnet" {
  description = "Controls subnet map_public_ip_on_launch setting"
  type        = bool
  default     = false
}

variable "is_public_subnet2" {
  description = "Controls subnet map_public_ip_on_launch setting"
  type        = bool
  default     = false
}

variable "sn_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

// CREATE Route table
variable "rtt_cidr" {
  description = "The CIDR block for the Route Table that allows internet connectivity"
  type        = string
  default     = "0.0.0.0/0"
}

// CREATE ALB variables
variable "alb_name" {
  type = string
}
variable "alb_internal" {
  type    = bool
  default = true
}
variable "alb_type" {
  type = string
}

# ALB Target group variables
variable "tg_name" {
  type = string
}

variable "tg_port" {
  type = number
}

variable "tg_proto" {
  type = string
}

# ALB Listener variables
variable "lst_port" {
  type = number
}

variable "lst_proto" {
  type = string
}

variable "lst_dft_type" {
  type = string
}

# ALB Security group variables 
variable "sg_name" {
  type = string
}
variable "sg_description" {
  type = string
}

# ALB SG rule variables 
variable "sg_rl_description" {
  type = string
}

#SG rule type
variable "sg_type" {
  type = string
}

#SG rule protocol
variable "sg_protocol" {
  type = string
}

#SG rule from port
variable "sg_from_port" {
  type = number
}

#SG rule to port
variable "sg_to_port" {
  type = number
}

#SG rule cidr block
variable "sg_cidr" {
  type = list(string)
}

// Placement group Variables
variable "plg_name" {
  type        = string
}

variable "plg_strategy" {
  type        = string
}

// ASG Security Group Variables
variable "asg_sg_name" {
  type = string
}

variable "asg_sg_description" {
  type = string
}

variable "asg_sg_rl_description" {
  type = string
}

variable "asg_sg_type" {
  type = string
}

variable "asg_sg_protocol" {
  type = string
}

variable "asg_sg_from_port" {
  type = number
}

variable "asg_sg_to_port" {
  type = number
}

variable "asg_sg_cidr" {
  type = list(string)
  default = []
}
// AutoScaling group variables

variable "asg_desired_cap" {
  type        = number
}

variable "asg_min_size" {
  type        = number
}

variable "asg_max_size" {
  type        = number
}

variable "lt_version" {
    type = string
    default = "$Latest"
}

// Launch Template variables
variable "lt_name" {
    type = string
}

variable "lt_blk_dev_name" {
    type = string
}

variable "lt_blk_vol_size" {
    type = number
}

variable "lt_shutdown_behav" {
    type = string
}

variable "lt_instance_type" {
  type = string
}

variable "lt_az" {
  type = string
}

variable "lt_sgs" {
  type        = list(string)
  default     = []
}

variable "tag_resource_type" {
  type = string
}

variable "tag_name" {
    type = string
}

// Key pair vars
variable "key_name" {
    type = string
}
  

 // Standalone EC2 instance security group 
variable "ec2_sg_name" {
  type = string
}

variable "ec2_sg_description" {
  type = string
}

variable "ec2_sg_rl_description" {
  type = string
}

variable "ec2_sg_type" {
  type = string
}

variable "ec2_sg_protocol" {
  type = string
}

variable "ec2_sg_from_port" {
  type = number
}

variable "ec2_sg_to_port" {
  type = number
}

variable "ec2_sg_cidr" {
  type = list(string)
  default = []
}

// standalone EC2 instance

  variable "ec2_inst_type" {
    type = string
  }

    variable "ec2_vol_size" {
      type = string
    }
    
  variable "ec2_name_tag"{
      type = string
  }

  variable "ec2_key_name" {
    type = string
  }
