variable "acl" {
  type = string
}
variable "bucket_name" {
  type = string
}

// Logs folder lifecycle rule vars
variable "lg_id"  {
  type = string
}

variable "lg_enabled" {
  type = bool
  default = true
}

variable "lg_prefix" {
  type = string
}

variable "lg_expir_days" {
  type = number
}

// Images folder lifecycle rule vars
variable "im_id" {
  type = string
}

variable "im_enabled" {
  type = bool
  default = true
}

variable "im_prefix" {
  type = string
}

variable "im_trans_days" {
  type = number
}
variable "im_storage_class" {
  type = string
}