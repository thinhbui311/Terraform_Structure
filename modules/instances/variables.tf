variable "ubuntu_ami" {
  type = string
  default = "ami-0a72af05d27b49ccb"
}

variable "instance_type" {
  type = string
  default = ""
}

variable "key_name" {
  type = string
  default = ""
}

variable "public_subnet" {
  type = string
  default = ""
}

variable "tag_name" {
  type = string
  default = ""
}

variable "env_name" {
  type = string
  default = ""
}
