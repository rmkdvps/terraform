variable "instance_ami" {
  type    = string
#   default = "ami-08885b6eb95123ab5" #packer ami
  # default = "ami-06d79c60d7454e2af"
}

variable "instance_type" {
  type    = string
  # default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group" {
  type = string
}

variable "env" {
  type = string
}