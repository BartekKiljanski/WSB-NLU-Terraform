resource "aws_security_group" "main" {
  name        = "${var.name_prefix}-rds-sg"
  description = "RDS security group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from EC2 security group"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-rds-sg"
    }
  )
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.name_prefix}-db-subnets"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-db-subnets"
    }
  )
}

resource "aws_db_instance" "main" {
  identifier                      = "${var.name_prefix}-db"
  engine                          = "postgres"
  engine_version                  = "15"
  instance_class                  = var.db_instance_class
  allocated_storage               = var.allocated_storage
  db_name                         = "appdb"
  username                        = "appuser"
  password                        = var.db_password
  port                            = 5432
  vpc_security_group_ids          = [aws_security_group.main.id]
  db_subnet_group_name            = aws_db_subnet_group.main.name
  publicly_accessible             = false
  multi_az                        = var.multi_az
  deletion_protection             = var.deletion_protection
  backup_retention_period         = var.backup_retention_period
  storage_encrypted               = true
  auto_minor_version_upgrade      = true
  copy_tags_to_snapshot           = true
  enabled_cloudwatch_logs_exports = ["postgresql"]
  skip_final_snapshot             = true

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-db"
    }
  )
}
