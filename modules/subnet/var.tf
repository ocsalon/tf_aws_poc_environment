
variable "subnets" {
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


variable "sn_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}