aws_region      = "eu-west-1"
aws_profile     = "default"
project         = "demo"
env             = "dev"

# VPC variables
vpc_cidr        = "10.101.0.0/16"
public_subnets  = ["10.101.0.0/20", "10.101.16.0/20", "10.101.32.0/20"]
private_subnets = ["10.101.48.0/20", "10.101.64.0/20", "10.101.80.0/20"]
intra_subnets   = ["10.101.96.0/20", "10.101.112.0/20", "10.101.128.0/20"]
azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]