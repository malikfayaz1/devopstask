# DevOps-technical-task

# This terraform code contain :
    VPC and subnets:
    Setup dedicated subnets across all availability zones in the region.
    Public subnets - for Internet facing services
    Private subnets - will be used for backend services
    DB subnets - used for RDS and other DB as-a-service solutions
    Elasticache subnets
    intra subnets - private subnets with NO Internet routing 

# We have Provider AWS which is define in init.tf fine where we also define that teraform will grater then version 0.15.

# We define VPC  Module source from terraformaws-modules/vpc/aws 
    Inside VPC we define Private and public subnets on spesific ip address
    like 10.101.0.0/16 for dev
    and 10.102.0.0/16 for production as per recomendation

    for S3 we also have one module tf-2-s3.tf where our env will be provisioned for log bucket , flow logs , log delivery, and we also have implementation of versioning.


# Tf-3-eks file i setup source , clustername, it is using t3.medium  instance type and using our VPC , public and private subnets. for now i am using 1 node and max size will also be 1 but we can we can provision it by changing the values 

# eks_node_desired_size        = 1
# eks_node_min_size            = 1
# eks_node_max_size            = 1

# our availability  Zone is  define in tfvars file 
# azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

We have same approach for our Prod environments as well


I choose the module approach for EKS where i refine all the cluster logs policies IAM , cloudwatch, Node group roles, cluster roles, etc.

How to Provison the infrastructure :

we have some commands i already discuss this in videos: 

# For Dev : 
    terraform init 
    terraform plan -var-file dev.tfvars
    terraform apply -var-file dev.tfvars
# for prod : 
    terraform init 
    terraform plan -var-file prod.tfvars
    terraform apply -var-file prod.tfvars

Videos: 
Part 1 = https://www.loom.com/share/03323e598d1d4405bb6124f57a9ff693
part 2 = https://www.loom.com/share/ced18649df65483383002c9edd40090e
part 3 = https://www.loom.com/share/29fb8039d3d54fb3ad671aa4d9e1568b
part 4 = https://www.loom.com/share/b3ac0be23506446abbb8ef7c5153382e
part 5 = https://www.loom.com/share/8384da86ad2048858347b2eeafa77d3e


For Helm : 
To install the chart with the release name LEMP:

$ helm install --name LEMP stable/lamp
$ helm install -f wordpress.yaml --name wordpress stable/lamp
The following tables list the configurable parameters of the LAMP chart and their default values.

$ helm install --name LEMP \
  --set init.clone.release=my-first-release-lamp,php.sockets=false,php.oldHTTPRoot=/var/www/my-website.com \
    stable/lamp

$ helm install --name LEMP -f values.yaml stable/lamp