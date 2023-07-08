variable "SonarQube_instance_type" {
  type = string
}

variable "nexus_instance_type" {
  type = string
}

variable "jenkins_instance_type" {
  type = string
}

variable "bastion_instance_type" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cider" {
  type = string
}

variable "secret_arn" {
  type = string
}