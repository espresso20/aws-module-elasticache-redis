variable "apply_immediately" {
  default     = true
  description = "Determine whether changes are performed immediate or during the defined maintenance window"
  type        = bool
}

variable "auth_token" {
  default     = null
  description = "Password used to auth to the Redis Cluster"
  type        = string
}

variable "automatic_failover_enabled" {
  default     = false
  description = "Allow Read Replica to be promoted to Read/Write Primary on Primary failure"
  type        = bool
}

variable "cluster_name" {
  description = "Name of the Redis Cluster"
  type        = string
}

variable "engine_version" {
  default     = "6.x"
  description = "Redis Cluster Version"
  type        = string
}

variable "kms_key_id" {
  default     = null
  description = "The KMS Key ID to be used to encrypt Redis data"
  type        = string
}

variable "maintenance_window" {
  default     = "sun:05:00-sun:06:00"
  description = "Time window in which cache maintenance should be performed"
  type        = string
}

variable "node_type" {
  description = "Type of Node to be used by Redis Cluster"
  type        = string
}

variable "num_node_groups" {
  default     = 1
  description = "Number of node groups to create as part of this cluster"
  type        = number
}

variable "parameter_group_name" {
  default     = "default.redis6.x"
  description = "Name of parameter group to use for your Redis Cluster"
  type        = string
}

variable "port" {
  default     = 6379
  description = "Port for the Redis Cluster to listen on"
  type        = number
}

variable "replicas_per_node_group" {
  default     = 1
  description = "Number of replicas to provision per node group"
  type        = number
}

variable "security_group_names" {
  default     = []
  description = "Map of Security Group names to apply to this Redis Cluster"
  type        = list(string)
}

variable "shared_tags" {
  default     = {}
  description = "Map of tags to be applied to ECS Cluster and it's associated resources"
  type        = map(any)
}

variable "snapshot_retention_limit" {
  default     = 0
  description = "Number of days in which to keep snapshots"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnets to deploy the ElastiCache Redis to"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID to deploy ECS in"
  type        = string
}