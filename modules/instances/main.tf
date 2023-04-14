resource "aws_instance" "frontend" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.public_subnet

  tags = {
    Name = var.tag_name
    Environment = var.env_name
  }
}
