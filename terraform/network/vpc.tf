resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cider

  tags = {
    Name = "main"
  }
}