module "eks" {
  source    = "./EKS"
  subnet_id_1 = module.network.private-sibnet-1
  subnet_id_2 = module.network.private-sibnet-2
  vpc_cider = var.VPC_CIDR
  vpc_id    = module.network.vpc_id
}