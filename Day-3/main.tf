module "bastion_instance_security_group" {
  source = "./modules/aws_sg"
  sg_name = "bastion-security-group"
  sg_description = "bastion security group"
  ingress_rule = [ 
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_from_port = 0
  egress_to_port = 0
  egress_protocol = "tcp"
  egress_cidr_blocks = ["0.0.0.0/0"]
}

module "test_instance_sg" {
  source = "./modules/aws_sg"
  sg_name = "test-instance-sg"
  sg_description = "testing security group"
  ingress_rule = [ 
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 30000
      to_port = 32767
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_from_port = 0
  egress_to_port = 0
  egress_protocol = "tcp"
  egress_cidr_blocks = ["0.0.0.0/0"]
}

module "bastion_instance" {
  source = "./modules/ec2_instance"
  ami_id = "ami-09b0a86a2c84101e1"
  security_group = module.bastion_instance_security_group.security_group_id
  instance_type_name = "t2.micro"
  key_name = "terraform-test"
  instance_tag_name = "aws-bastion"
}

module "test_instance" {
  source = "./modules/ec2_instance"
  ami_id = "ami-09b0a86a2c84101e1"
  security_group = module.test_instance_sg.security_group_id
  instance_type_name = "t2.micro"
  key_name = "terraform-test"
  instance_tag_name = "aws-test-instance"
}