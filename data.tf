data "aws_security_groups" "main" {
  filter {
    name   = "group-name"
    values = var.security_group_names
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}