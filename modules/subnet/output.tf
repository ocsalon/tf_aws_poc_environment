output "vpc_id" {
  description = "ID of PoC VPC"
  value       = aws_subnet.this.*.id
}