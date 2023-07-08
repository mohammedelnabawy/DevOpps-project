output "vpc_id" {
  value = aws_vpc.main.id
}

output "public-sibnet-1" {
  value = aws_subnet.public-1.id
}

output "public-sibnet-2" {
  value = aws_subnet.public-2.id
}

output "private-sibnet-1" {
  value = aws_subnet.private-1.id
}

output "private-sibnet-2" {
  value = aws_subnet.private-2.id
}
