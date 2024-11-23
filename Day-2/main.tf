resource "aws_instance" "example" {
  count                 = 1
  key_name              = "aws-test"
  subnet_id             = "sb-1231321123"
  instance_type         = "t2-micro"
  provider              = aws.ap-south1
}

resource "aws_instance" "example" {
  count                 = 1
  key_name              = "aws-test"
  subnet_id             = "sb-1231321123"
  instance_type         = "t2-micro"
  provider              = aws.us-east1
}