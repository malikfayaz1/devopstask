variable "tags" { type = map(any) }

#--------------------------------------------
#--------------- Cluster --------------------
#--------------------------------------------
variable "cluster_name" {
  type = string
  description = "The name of cluster, e.g. \"demo\""
}

variable "eks_version" {
  type = string
}

variable "private_subnets" { 
  type = list(string)
  description = "List of private subnet IDs"
}

variable "public_subnets" {
  type = list(string)
  description = "List of private subnet IDs"
}

variable "eks_cluster_log_types" {
  type = list(string)
  description = "List of cluster logs [\"api\", \"audit\", \"authenticator\", \"controllerManager\", \"scheduler\"]"
}


#--------------------------------------------
#--------- Cluster Node Group ---------------
#--------------------------------------------
variable "eks_node_group_instance_type" {
  type = string
  description = "Instance type of node group"
}

variable "eks_node_desired_size" {
  type = string
}

variable "eks_node_min_size" {
  type = string
}

variable "eks_node_max_size" {
  type = string
}

