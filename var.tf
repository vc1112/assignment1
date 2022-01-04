provider "aws" {
region = "ap-south-1"
access_key = "AKIA6CRC6Y4P56SZHKNS"
secret_key = "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"
}

variable "aws_region" {
default = "ap-south-1"
}

variable "vpc_cidr" {
default = "10.0.0.0/16"
}

variable "subnets_cidr" {
default = "10.0.1.0/24"
}

variable "azs" {
default = "ap-south-1a"
}