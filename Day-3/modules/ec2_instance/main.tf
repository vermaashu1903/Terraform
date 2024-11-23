resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type = var.instance_type_name
  vpc_security_group_ids = [var.security_group]
  key_name = var.key_name
  tags = {
    "Name": var.instance_tag_name
  }
}