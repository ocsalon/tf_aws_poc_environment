resource "aws_subnet" "this" {
  count                   = length(var.subnets)
  vpc_id                  = var.sn_vpc_id
  cidr_block              = element(concat(var.subnets, [""]), count.index)
  availability_zone       = length(regexall("^[a-z]{2}-", element(var.sn_azs, count.index))) > 0 ? element(var.sn_azs, count.index) : null
  availability_zone_id    = length(regexall("^[a-z]{2}-", element(var.sn_azs, count.index))) == 0 ? element(var.sn_azs, count.index) : null
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = var.sn_tags
}