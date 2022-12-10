aws_region      = "eu-west-1"
aws_profile     = "default"
project         = "demo"
env             = "prod"

# VPC variables
vpc_cidr        = "10.102.0.0/16"
public_subnets  = ["10.102.0.0/20", "10.102.16.0/20", "10.102.32.0/20"]
private_subnets = ["10.102.48.0/20", "10.102.64.0/20", "10.102.80.0/20"]
intra_subnets   = ["10.102.96.0/20", "10.102.112.0/20", "10.102.128.0/20"]
azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]