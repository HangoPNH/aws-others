###########
### MSK ###
###########

output "ciac_msk_cluster_arn" {
  value = aws_msk_cluster.ciac_msk_cluster.arn
}

output "ciac_msk_cluster_version" {
  value = aws_msk_cluster.ciac_msk_cluster.current_version
}

output "ciac_msk_cluster_brokers_sasl_scram" {
  value = aws_msk_cluster.ciac_msk_cluster.bootstrap_brokers_sasl_scram
}

