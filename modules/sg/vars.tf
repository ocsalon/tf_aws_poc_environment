
variable "sg_name" {
  description = "name of the security group"
  type        = string
  default     = ""
}
variable "sg_description" {
  description = "description of the security group"
  type        = string
  default     = ""
}

variable "sg_vpc_id" {
  description = "VPC ID to associate to this security group"
  type        = string
  default     = ""
}

