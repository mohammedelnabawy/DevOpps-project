module "eks" {
  source = "./EKS"
  subnet_id = var.PRIVATE_SUBNET_1_CIDR 
  vpc_cider = var.VPC_CIDR
  vpc_id = module.network.vpc_id
}