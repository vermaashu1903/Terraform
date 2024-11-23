resource "aws_instance" "example" {
  count                     = 1     # no. of instances you want to create
  ami                       = "ami-052c08d70def0ac62"   # enter ami-id according to the instance you want
  instance_type             = "t2.micro"    # change according to you
  subnet_id                 = "subnet-0123456789abcdef0"    # enter subnet id of default vpc
  key_name                  = "test"    # key-pair name
  vpc_security_group_ids    = [aws_security_group.example.id]
  user_data                 = file("userdata.tpl")

  tags = {
    "Name" = "example"
  }
}

output "example_public_ip" {
  value = ["${aws_instance.example.*.public_ip}"]
}