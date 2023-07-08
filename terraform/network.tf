module "network" {
  source = "./network"
  vpc_cider = var.VPC_CIDR
  public-cider-1 = var.PUCLIC_SUBNET_1_CIDR
  public-cider-2 = var.PUCLIC_SUBNET_2_CIDR
  private-cider-1 = var.PRIVATE_SUBNET_1_CIDR
  private-cider-2 = var.PRIVATE_SUBNET_2_CIDR
  az_1 = var.AZ_1
  az_2 = var.AZ_2
}