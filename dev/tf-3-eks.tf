module "eks" {
  source                       = "../modules/eks"
  cluster_name                 = "dev-cluster"
  eks_version                  = "1.22"
  private_subnets              = module.vpc.private_subnets
  public_subnets               = module.vpc.public_subnets
  eks_cluster_log_types        = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  eks_node_group_instance_type = "t3.medium"
  eks_node_desired_size        = 2
  eks_node_min_size            = 2
  eks_node_max_size            = 2
  tags                         = {
    Env       = "dev"
    Project   = "dev"
    Terraform = true
  }
}