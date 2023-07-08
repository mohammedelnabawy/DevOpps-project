module "instances" {
  source = "./instances"
  SonarQube_instance_type = var.SONARQUBE_INSTANCE_TYPE
  nexus_instance_type = var.NEXUS_INSTANCE_TYPE
  jenkins_instance_type = var.JENKINS_INSTANCE_TYPE
  bastion_instance_type = var.BASTION_INSTANCE_TYPE
  public_subnet_id = module.network.public-sibnet-1
  private_subnet_id = module.network.private-sibnet-1
  vpc_id = module.network.vpc_id
  secret_arn = var.SECRET_ARN
  vpc_cider = var.VPC_CIDR
}