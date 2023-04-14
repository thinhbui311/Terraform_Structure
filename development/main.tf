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

module "networking" {
  source = "../modules/networking"

  vpc_name                 = "VPC - secondary"
  vpc_environment_name     = "Dev"
  subnet_cidr_block        = "10.0.1.0/24"
  subnet_availability_zone = "ap-southeast-1a"
  subnet_name              = "Dev Public subnet"
  subnet_env_name          = "Dev"
}

module "s3" {
  source = "../modules/s3"

  bucket_name = "thinh-tf-test-bucket"
  tag_name    = "Teaching"
  tag_env     = "DEV"
}

module "instances" {
  source = "../modules/instances"

  instance_type = "t2.micro"
  key_name      = "deployer-key"
  public_subnet = module.networking.subnet_id
  tag_name      = "Terraform EC2"
  env_name      = "DEV"
}
