module "instances" {
  source = "./instances"
  SonarQube_instance_type = var.SONARQUBE_INSTANCE_TYPE
  nexus_instance_type = var.NEXUS_INSTANCE-TYPE
  jenkins_instance_type = var.JENKINS-INSTANCE_TYPE
  bastion_instance_type = var.BASTION_INSTANCE_TYPE
  subnet_id = module.network.public-sibnet-1
}