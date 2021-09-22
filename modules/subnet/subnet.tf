resource "aws_subnet" "public" {
  count = length(var.subnets)
  vpc_id     = var.sn_vpc_id
  cidr_block = element(concat(var.subnets, [""]), count.index)
  availability_zone               = length(regexall("^[a-z]{2}-", element(var.sn_azs, count.index))) > 0 ? element(var.sn_azs, count.index) : null
  availability_zone_id            = length(regexall("^[a-z]{2}-", element(var.sn_azs, count.index))) == 0 ? element(var.sn_azs, count.index) : null
  tags = var.sn_tags
}