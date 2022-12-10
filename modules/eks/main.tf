#--------------------------------------------
#--------------- Cluster --------------------
#--------------------------------------------
resource "aws_eks_cluster" "eks_cluster" {
  name                      = "${var.cluster_name}-eks"
  role_arn                  = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = var.eks_cluster_log_types
  version                   = var.eks_version

  vpc_config {
    subnet_ids = concat(var.public_subnets, var.private_subnets)
  }

  timeouts {
    delete = "30m"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.cloudwatch_log_group
  ]

  tags = var.tags
}

#--------------------------------------------
#--------- Cluster Node Group ---------------
#--------------------------------------------
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = var.public_subnets

  scaling_config {
    desired_size = var.eks_node_desired_size
    max_size     = var.eks_node_max_size
    min_size     = var.eks_node_min_size
  }

  instance_types = ["${var.eks_node_group_instance_type}"]

  tags = var.tags
  
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}