variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  type = string
  default = "default"
}

variable "vpc_name" {
  type = string
  default = ""
}

variable "vpc_environment_name" {
  type = string
  default = ""
}

variable "subnet_cidr_block" {
  type = string
  default = ""
}

variable "subnet_availability_zone" {
  type = string
  default = ""
}

variable "subnet_name" {
  type = string
  default = ""
}

variable "subnet_env_name" {
  type = string
  default = ""
}
