# create msk configuration
resource "aws_msk_configuration" "ciac_msk_configuration" {
  kafka_versions = [var.ciac_msk_cluster_version]
  name           = var.ciac_msk_configuration

  server_properties = <<PROPERTIES
auto.create.topics.enable=true
default.replication.factor=2
min.insync.replicas=2
num.io.threads=8
num.network.threads=5
num.partitions=1
num.replica.fetchers=2
replica.lag.time.max.ms=30000
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
socket.send.buffer.bytes=102400
unclean.leader.election.enable=true
zookeeper.session.timeout.ms=18000
zookeeper.connection.timeout.ms=6000
PROPERTIES

  lifecycle {
    create_before_destroy = true
  }
}

# create msk cluster
resource "aws_msk_cluster" "ciac_msk_cluster" {
  cluster_name           = "${var.ciac_msk_cluster_name}-${var.infra_env}"
  kafka_version          = var.ciac_msk_cluster_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type  = var.ciac_msk_brokers_instance_type
    client_subnets = var.private_app_subnet_ids

    storage_info {
      ebs_storage_info {
        volume_size = 100
      }
    }
    security_groups = [aws_security_group.ciac_msk_sg.id]
  }

  client_authentication {
    sasl {
      scram = true
    }
  }

  configuration_info {
    arn      = aws_msk_configuration.ciac_msk_configuration.arn
    revision = aws_msk_configuration.ciac_msk_configuration.latest_revision
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.ciac_msk_kms_key.arn
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = false
      }
      node_exporter {
        enabled_in_broker = false
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.ciac_msk_cloudwatch_log_group.name
      }
    }
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-msk-cluster-${var.region_name}-${var.infra_env}"
    }
  )
}

# associate sm to msk
resource "aws_msk_scram_secret_association" "ciac_msk_scram_secret_association" {
  cluster_arn     = aws_msk_cluster.ciac_msk_cluster.arn
  secret_arn_list = [data.aws_secretsmanager_secret.ciac_msk_secretsmanager_secret.arn]

  depends_on = [data.aws_secretsmanager_secret_version.ciac_msk_secretsmanager_version]
}
