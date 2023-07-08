variable "REGION" {
  type        = string
    description = "value"
}
variable "VPC_CIDR" {
  type        = string
  description = ""
}
variable "PUCLIC_SUBNET_1_CIDR" {
  type        = string
  description = ""
}

variable "PUCLIC_SUBNET_2_CIDR" {
  type        = string
  description = ""
}

variable "PRIVATE_SUBNET_1_CIDR" {
  type        = string
  description = ""
}

variable "PRIVATE_SUBNET_2_CIDR" {
  type        = string
  description = ""
}

variable "AZ_1" {
  type        = string
  description = ""
}

variable "AZ_2" {
  type        = string
  description = ""
}

variable "SONARQUBE_INSTANCE_TYPE" {
  type = string
}

variable "NEXUS_INSTANCE_TYPE" {
  type = string
}

variable "JENKINS_INSTANCE_TYPE" {
  type = string
}

variable "BASTION_INSTANCE_TYPE" {
  type = string
}

variable "SECRET_ARN" {
  type = string
}