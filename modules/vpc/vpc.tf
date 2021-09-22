resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block                       = var.cidr
  instance_tenancy                 = var.instance_tenancy


  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}