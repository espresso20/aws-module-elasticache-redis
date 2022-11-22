resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.cluster_name}-subnet"
  subnet_ids = var.subnet_ids
  tags       = var.shared_tags
}

resource "aws_elasticache_replication_group" "main" {
  auth_token                    = var.auth_token
  replication_group_id          = var.cluster_name
  replication_group_description = "Redis Cluster for ${var.cluster_name}"
  engine                        = "redis"
  engine_version                = var.engine_version
  node_type                     = var.node_type
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true
  kms_key_id                    = var.kms_key_id
  snapshot_retention_limit      = var.snapshot_retention_limit

  cluster_mode {
    num_node_groups         = var.num_node_groups
    replicas_per_node_group = var.replicas_per_node_group
  }

  automatic_failover_enabled = var.automatic_failover_enabled
  maintenance_window         = var.maintenance_window
  apply_immediately          = var.apply_immediately
  security_group_ids         = data.aws_security_groups.main.ids
  subnet_group_name          = aws_elasticache_subnet_group.main.name


  tags = merge(var.shared_tags, {
    Name        = var.cluster_name
    Description = "DB Instance for ${var.cluster_name}"
  })

  lifecycle {
    ignore_changes = [
      cluster_mode,
      engine_version
    ]
  }
}