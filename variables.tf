variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "instance_ami" {
  type    = string
#   default = "ami-08885b6eb95123ab5" #packer ami
  default = "ami-06d79c60d7454e2af"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}