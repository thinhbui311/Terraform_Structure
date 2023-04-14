terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }

  backend "s3" {
    bucket  = "thinh-terraform-dev-state"
    key     = "tf-state/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = "true"
    profile = "personal"
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "personal"
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "VPC - secondary"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name        = "Public subnet"
    Environment = "Dev"
  }
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "thinh-tf-test-bucket"
  tag_name    = "Teaching"
  tag_env     = "DEV"
}

module "instances" {
  source = "./modules/instances"

  instance_type = "t2.micro"
  key_name      = "deployer-key"
  public_subnet = aws_subnet.public_subnet.id
  tag_name      = "Terraform EC2"
  env_name      = "DEV"
}
