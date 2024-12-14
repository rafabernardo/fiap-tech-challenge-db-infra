data "aws_security_group" "security_group" {
  name = "${var.projectName}-rds-sg"
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpcCidr
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

