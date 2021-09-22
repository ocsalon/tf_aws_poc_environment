output "vpc_id" {
  description = "ID of PoC VPC"
  value = aws_vpc.this.*.id
}