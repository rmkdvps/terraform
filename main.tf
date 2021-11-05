terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
#   access_key = var.access_key
#   secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "rmkdvps-terraform-state"
    key    = "global/s3/rmkdvps-terraform-state/terraform.tfstate"
    region = "eu-west-3"

    dynamodb_table = "rmkdvps-terraform-locks"
    encrypt        = true
  }
}

module "network" {
  source = "./modules/network"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

module "jenkins" {
  source = "./modules/jenkins"
  instance_ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = module.network.subnet_id
  vpc_security_group = module.network.vpc_sec_gr
  env = terraform.workspace
}


