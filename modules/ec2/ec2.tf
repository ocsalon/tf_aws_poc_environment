resource "aws_instance" "web" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_inst_type
  vpc_security_group_ids = var.ec2_sg_ids
  subnet_id = var.ec2_sn_id
  key_name = var.ec2_key_name
    root_block_device {
      volume_size = var.ec2_vol_size
    }
  tags = {
    Name = var.ec2_name_tag
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ec2_key_name
  public_key = tls_private_key.this.public_key_openssh
}