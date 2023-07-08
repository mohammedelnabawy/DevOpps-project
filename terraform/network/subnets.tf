resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-cider-1
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-cider-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-cider-2
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "public-cider-2"
  }
}

resource "aws_subnet" "private-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-cider-1
  availability_zone = var.az_1

  tags = {
    Name = "private-cider-1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-cider-2
  availability_zone = var.az_2

  tags = {
    Name = "private-cider-2"
  }
}

