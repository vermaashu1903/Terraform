variable "ami_id" {
  type = string
  description = "Ami id for ubuntu instance"
}

variable "instance_tag_name" {
  type = string
  description = "Name of the instance"
}

variable "instance_type_name" {
  type = string
  description = "Instance type"
}

variable "security_group" {
  type = string
  description = "security group used by instance"
}

variable "key_name" {
  type = string
}
