variable "vpc_create" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
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

variable "create_igw" {
 type = bool
 default = false  
}

variable "rtt_cidr" {
  description = "The CIDR block for the Route Table that allows internet connectivity"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_subnet_ids" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}
