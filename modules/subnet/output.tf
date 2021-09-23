output "subnet_id" {
  description = "ID of PoC subnet"
  value       = aws_subnet.this.*.id
}