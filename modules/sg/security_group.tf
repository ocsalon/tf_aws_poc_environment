resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //tags = var.tags
}
