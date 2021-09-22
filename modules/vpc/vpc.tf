resource "aws_vpc" "this" {
  count = var.vpc_create ? 1 : 0

  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = var.vpc_ins_tenancy


  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    var.vpc_tags,
  )
}