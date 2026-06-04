locals {
  name_prefix = "wsb-${var.student_name}-${var.environment}"

  environment_settings = {
    dev = {
      instance_type           = "t3.micro"
      db_instance_class       = "db.t3.micro"
      allocated_storage       = 20
      multi_az                = false
      deletion_protection     = false
      backup_retention_period = 1
    }
    prod = {
      instance_type           = "t3.small"
      db_instance_class       = "db.t3.small"
      allocated_storage       = 100
      multi_az                = true
      deletion_protection     = true
      backup_retention_period = 7
    }
  }

  settings = local.environment_settings[var.environment]

  all_tags = merge(
    {
      ManagedBy   = "Terraform"
      Environment = var.environment
      Student     = var.student_name
      Project     = "wsb-cw3"
    },
    var.tags
  )

  subnet_ids = sort(data.aws_subnets.env.ids)
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["devops-vpc"]
  }
}

data "aws_subnets" "env" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  filter {
    name   = "tag:Environment"
    values = [var.environment]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

module "ec2" {
  source = "../../modules/ec2"

  vpc_id           = data.aws_vpc.main.id
  subnet_id        = local.subnet_ids[0]
  ami_id           = data.aws_ami.amazon_linux.id
  instance_type    = local.settings.instance_type
  environment      = var.environment
  name_prefix      = local.name_prefix
  ssh_cidr         = var.ssh_cidr
  enable_public_ip = var.enable_public_ip
  tags             = local.all_tags
}

module "rds" {
  source = "../../modules/rds"

  vpc_id                  = data.aws_vpc.main.id
  subnet_ids              = local.subnet_ids
  ec2_security_group_id   = module.ec2.security_group_id
  db_password             = var.db_password
  db_instance_class       = local.settings.db_instance_class
  allocated_storage       = local.settings.allocated_storage
  multi_az                = local.settings.multi_az
  deletion_protection     = local.settings.deletion_protection
  backup_retention_period = local.settings.backup_retention_period
  name_prefix             = local.name_prefix
  tags                    = local.all_tags
}
