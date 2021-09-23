resource "aws_placement_group" "this" {
  name     = var.plg_name
  strategy = var.plg_strategy
}

resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.asg_sn_id
  desired_capacity   = var.asg_desired_cap
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size

  launch_template {
    id      = aws_launch_template.this.id
    version = var.lt_version
  }
}

resource "aws_launch_template" "this" {
  name = var.lt_name
  block_device_mappings {
    device_name = var.lt_blk_dev_name

    ebs {
      volume_size = var.lt_blk_vol_size
    }
  }

  image_id = var.lt_ami_id
  instance_initiated_shutdown_behavior = var.lt_shutdown_behav
  instance_type = var.lt_instance_type
  key_name = aws_key_pair.generated_key.key_name
   placement {
    availability_zone = var.lt_az
  }
  vpc_security_group_ids = var.lt_sgs
  tag_specifications {
    resource_type = var.tag_resource_type
    tags = {
      Name = var.tag_name
    }
  }
  user_data            = filebase64(data.template_file.cloud_init.rendered)
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}