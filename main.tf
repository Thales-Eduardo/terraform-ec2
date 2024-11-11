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


