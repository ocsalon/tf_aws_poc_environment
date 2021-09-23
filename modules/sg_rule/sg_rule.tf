
resource "aws_security_group_rule" "this" {
  security_group_id = var.sg_id
  description       = var.sg_rl_description
  type              = var.sg_type
  protocol          = var.sg_protocol
  from_port         = var.sg_from_port
  to_port           = var.sg_to_port
  cidr_blocks       = var.sg_cidr
}
