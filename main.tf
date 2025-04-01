terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
  backend "s3" {
    bucket = "algatux-opentofu-states"
    key    = "/states/eks-infrastructure.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_subnet" "test-subnet" {
  vpc_id     = var.target_vpc
  cidr_block = "172.31.48.0/20"

  tags = {
    Name = "Main"
  }
}