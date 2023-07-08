resource "aws_security_group" "allow_ssh-for-instances" {
  name        = "allow_ssh-for-instances"
  description = "allow_ssh-for-instances inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_security_group" "sonarQube_sec_group" {
  name        = "sonarQube_ports"
  description = "sonarQube_ports"
  vpc_id      = var.vpc_id

  ingress {
    description = "tls"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cider]
  }

  ingress {
    description = "default sonarqube port"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cider]
  }

  tags = {
    Name = "sonarQube_sec_group"
  }
}

resource "aws_security_group" "nexus_sec_group" {
  name        = "nexus_ports"
  description = "nexus_ports"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cider]
  }

  ingress {
    description = "ssh"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cider]
  }

  tags = {
    Name = "nexus_sec_group"
  }
}

resource "aws_security_group" "jenkins_sec_group" {
  name        = "jenkins_ports"
  description = "jenkins_ports"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cider]
  }

  tags = {
    Name = "jenkins_sec-group"
  }
}