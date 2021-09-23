resource "aws_vpc" "this" {
  count = var.vpc_create ? 1 : 0

  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_ins_tenancy


  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    var.vpc_tags,
  )
}

resource "aws_internet_gateway" "this" {
  count = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.this[0].id  
}

resource "aws_route_table" "rtt_public" {
  vpc_id = aws_vpc.this[0].id

  route = [
    {
      cidr_block = var.rtt_cidr
      gateway_id = aws_internet_gateway.this[0].id
      carrier_gateway_id = "" 
      destination_prefix_list_id = "" 
      egress_only_gateway_id = ""
      instance_id = "" 
      ipv6_cidr_block = "" 
      local_gateway_id = "" 
      nat_gateway_id = ""
      network_interface_id = "" 
      transit_gateway_id = "" 
      vpc_endpoint_id = "" 
      vpc_peering_connection_id = "" 
    }    
  ]

  tags = {
    Name = "rtt-public"
  }
}

resource "aws_route_table_association" "this" {
  count = length(var.public_subnet_ids)
  subnet_id      = element(var.public_subnet_ids,count.index)
  route_table_id = aws_route_table.rtt_public.id
}