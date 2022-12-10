output "vcp_id" {
    value = module.vpc.vpc_id
}

output "flow_logs_destination" {
    value = module.vpc.vpc_flow_log_destination_arn
}

