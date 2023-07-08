data "aws_nat_gateway" "ng" {
  subnet_id = aws_subnet.public-1.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [ aws_internet_gateway.gw ]
}