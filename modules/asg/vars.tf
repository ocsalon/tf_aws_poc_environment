// Placement group Variables
variable "plg_name" {
  type        = string
}

variable "plg_strategy" {
  type        = string
}

// AutoScaling group variables
variable "asg_vpc" {
  type        = list(string)
  default     = []
}

variable "asg_sn_id" {
  type = list(string)
}

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

variable "lt_ami_id" {
    type = string
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
  
variable "alb_tg_arns" {
  type = list(string)
}