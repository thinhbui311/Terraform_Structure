resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy

  tags = {
    Name = var.vpc_name
    Environment = var.vpc_environment_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_availability_zone

  tags = {
    Name        = var.subnet_name
    Environment = var.subnet_env_name
  }
}
