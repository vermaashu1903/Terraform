variable "sg_name" {
  description = "name of the security group"
  type = string
}
variable "sg_description" {
  description = "description for the security group"
  type = string
}

# variables for ingres rules
variable "ingress_rule" {
  description = "list of ingress rules"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
}

# variables for egress rules
variable "egress_from_port" {
  description = "egress from port"
  type = number
}
variable "egress_to_port" {
  description = "egress to port"
  type = number
}
variable "egress_protocol" {
  description = "protocol for engress"
  type = string
}
variable "egress_cidr_blocks" {
  description = "egress cidr_blocks"
  type = list(string)
}