resource "aws_route_table_association" "public-route-1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-route.id
}
resource "aws_route_table_association" "public-route-2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-route.id
}
resource "aws_route_table_association" "private-route-1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-route.id
}
resource "aws_route_table_association" "private-route-2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-route.id
}