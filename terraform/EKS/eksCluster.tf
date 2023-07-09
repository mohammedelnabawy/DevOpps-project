resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks-cluster-role.arn

  vpc_config {
    subnet_ids         = [var.subnet_id_1, var.subnet_id_2]
    security_group_ids = [aws_security_group.allow_ssh.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-role-AmazonEKSClusterPolicy,
  ]
}
output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}