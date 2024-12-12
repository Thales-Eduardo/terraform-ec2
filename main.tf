terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "thales eduardo"
      managed-by = "terraform"
    }
  }
}

resource "aws_key_pair" "key-pair-shh" {
  key_name   = "aws-key"
  public_key = file("${path.module}/ssh.txt")
  #   public_key = var.ssh_pub
}

resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC-terraform"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

module "ec2-private" {
  source     = "./modules/ec2-private"
  vpc_id     = aws_vpc.vpc.id
  key_name   = aws_key_pair.key-pair-shh.key_name
  cidr_block = var.cidr_block
}

module "ec2-public" {
  source     = "./modules/ec2-public"
  vpc_id     = aws_vpc.vpc.id
  key_name   = aws_key_pair.key-pair-shh.key_name
  gateway_id = aws_internet_gateway.internet_gateway.id
  cidr_block = var.cidr_block
}
