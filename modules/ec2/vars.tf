variable "ec2_ami_id" {
    type = string
}
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

    variable "ec2_sn_id" {
    type = string
  }

  variable "ec2_sg_ids" {
    type = list(string)
  }