
#SG rule id
variable "sg_id" {
  type = string
}

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


