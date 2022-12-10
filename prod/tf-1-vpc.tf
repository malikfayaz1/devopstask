module "vpc" {

  source = "terraform-aws-modules/vpc/aws"
  # version = "3.14.0"

  name = "${var.project}-${var.env}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  intra_subnets   = var.intra_subnets

  create_igw           = true
  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  single_nat_gateway                              = true
  reuse_nat_ips                                   = false
  enable_flow_log                                 = true
  flow_log_destination_arn                        = aws_s3_bucket.log_bucket.arn
  flow_log_destination_type                       = "s3"
  create_flow_log_cloudwatch_log_group            = true
  create_flow_log_cloudwatch_iam_role             = true
  flow_log_cloudwatch_log_group_retention_in_days = 7


  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }

  private_subnet_tags = {
    Name       = "${var.project}-${var.env}-private-subnet"
    Env        = var.env
    Terraform  = "true"
    Project    = var.project
  }

  public_subnet_tags = {
    Name       = "${var.project}-${var.env}-public-subnet"
    Env        = var.env
    Terraform  = "true"
    Project    = var.project
  }

  intra_subnet_tags = {
    Name       = "${var.project}-${var.env}-isolated-subnet"
    Env        = var.env
    Terraform  = "true"
    Project    = var.project
  }

  vpc_tags = {
    Name      = "${var.project}-${var.env}-vpc"
    Env       = var.env
    Terraform = "true"
    Project   = var.project
  }

  tags = {
    Name      = "${var.project}-${var.env}"
    Env       = var.env
    Terraform = "true"
  }
}