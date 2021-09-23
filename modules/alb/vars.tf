
# ALB variables 
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
variable "alb_sns" {
 type = list(string)
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
variable "tg_vpc_id" {
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
variable "sg_vpc_id" {
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



