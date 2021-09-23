output "vpc_id" {
  description = "ID of PoC VPC"
  value       = aws_vpc.this.*.id
}

output "vpc_igw" {
  description = "ID of PoC VPC Internet Gateway"
  value       = aws_internet_gateway.this.*.id
}