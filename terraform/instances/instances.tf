data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "SonarQube" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.SonarQube_instance_type
  key_name = aws_key_pair.ec2.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh-for-instances ]
  associate_public_ip_address = true
  subnet_id = var.subnet_id

  tags = {
    Name = "SonarQube"
  }
}

resource "aws_instance" "nexus" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.nexus_instance_type
  key_name = aws_key_pair.ec2.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh-for-instances ]
  associate_public_ip_address = true
  subnet_id = var.subnet_id

  tags = {
    Name = "nexus"
  }
}

resource "aws_instance" "nexus" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.jenkins_instance_type
  key_name = aws_key_pair.ec2.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh-for-instances ]
  associate_public_ip_address = true
  subnet_id = var.subnet_id

  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "nexus" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.bastion_instance_type
  key_name = aws_key_pair.ec2.id
  vpc_security_group_ids = [ aws_security_group.allow_ssh-for-instances ]
  associate_public_ip_address = true
  subnet_id = var.subnet_id

  tags = {
    Name = "bastion"
  }
}