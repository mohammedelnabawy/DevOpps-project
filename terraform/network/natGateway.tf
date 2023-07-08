resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.public-1.id
  allocation_id = aws_eip.elastic-ip.id
  tags = {
    Name = "gw NAT"
  }
  depends_on = [ aws_internet_gateway.gw ]
}