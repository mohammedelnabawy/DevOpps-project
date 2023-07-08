resource "aws_security_group" "allow_ssh-for-instances" {
  name        = "allow_ssh-for-instances"
  description = "allow_ssh-for-instances inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "instances-security-group"
  }
}