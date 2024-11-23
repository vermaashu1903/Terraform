resource "aws_security_group" "example" {
  name              = "example"
  description       = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id            = "vpc-0123456789abcdef0"    # enter your default vpc id
  tags = {
    "Name" = "example"
  }
}

# ingress rules
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id     = aws_security_group.example.id
  cidr_ipv4             = "0.0.0.0/0"
  from_port             = 22
  ip_protocol           = "tcp"
  to_port               = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id     = aws_security_group.example.id
  cidr_ipv4             = "0.0.0.0/0"
  from_port             = 80
  ip_protocol           = "tcp"
  to_port               = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id     = aws_security_group.example.id
  cidr_ipv4             = "0.0.0.0/0"
  from_port             = 443
  ip_protocol           = "tcp"
  to_port               = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id     = aws_security_group.example.id
  cidr_ipv6             = "::/0"
  from_port             = 443
  ip_protocol           = "tcp"
  to_port               = 443
}

# egress rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id     = aws_security_group.example.id
  cidr_ipv4             = "0.0.0.0/0"
  ip_protocol           = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.example.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" 
}
