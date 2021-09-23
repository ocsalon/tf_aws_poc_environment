

// create security group
module "alb-sg" {
  source                  = "../sg"
  sg_name                 = var.sg_name
  sg_description          = var.sg_description
  sg_vpc_id               = var.sg_vpc_id
}
// create sg rule

module "alb-sg-rule" {
  source = "../sg_rule"
  sg_id = module.alb-sg.sg_id
  sg_rl_description = var.sg_rl_description 
  sg_type = var.sg_type
  sg_protocol =  var.sg_protocol
  sg_from_port = var.sg_from_port 
  sg_to_port = var.sg_to_port 
  sg_cidr = var.sg_cidr
}

resource "aws_alb" "this" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_type
  security_groups    = [module.alb-sg.sg_id]
  subnets            = var.alb_sns
}

resource "aws_lb_target_group" "this" {
  name     = var.tg_name //"tf-example-lb-tg"
  port     = var.tg_port //80
  protocol = var.tg_proto //"HTTP"
  vpc_id   = var.tg_vpc_id
}


resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.arn
  port              = var.lst_port
  protocol          = var.lst_proto #"HTTP"


  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = var.lst_dft_type 
  }
}
