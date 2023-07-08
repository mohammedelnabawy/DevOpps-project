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
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.SonarQube_instance_type
  key_name                    = aws_key_pair.ec2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh-for-instances.id, aws_security_group.sonarQube_sec_group.id]
  subnet_id                   = var.private_subnet_id

  tags = {
    Name = "SonarQube"
  }
}

resource "aws_instance" "nexus" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.nexus_instance_type
  key_name                    = aws_key_pair.ec2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh-for-instances.id, aws_security_group.nexus_sec_group.id]
  subnet_id                   = var.private_subnet_id

  tags = {
    Name = "nexus"
  }
}

resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.jenkins_instance_type
  key_name                    = aws_key_pair.ec2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh-for-instances.id, aws_security_group.jenkins_sec_group.id]
  subnet_id                   = var.private_subnet_id

  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.bastion_instance_type
  key_name                    = aws_key_pair.ec2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh-for-instances.id]
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  user_data = <<-EOF
              #!/bin/bash
              sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.8.9.zip" -o "awscliv2.zip"
              sudo apt update
              sudo apt install unzip -y
              sudo apt install openjdk-11-jdk -y
              sudo unzip awscliv2.zip
              sudo ./aws/install
              sudo mkdir /home/ubuntu/.aws/
              sudo touch /home/ubuntu/.aws/credentials
              echo '${tls_private_key.pk.private_key_openssh}' > /home/ubuntu/server.pem
              chmod 0400 /home/ubuntu/bastion.pem
              curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl
              chmod +x ./kubectl
              mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
              echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
              mkdir /home/ubuntu/.aws
              echo "[eks-creator]" >> /home/ubuntu/.aws/credentials
              echo "aws_access_key_id = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["access_key"]}" >> /home/ubuntu/.aws/credentials
              echo "aws_secret_access_key = ${jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["secret_key"]}" >> /home/ubuntu/.aws/credentials
              aws eks update-kubeconfig --region us-east-1 --name eks-cluster --profile=eks-creator
              EOF
  tags = {
    Name = "bastion"
  }
}