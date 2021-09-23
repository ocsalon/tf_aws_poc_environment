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