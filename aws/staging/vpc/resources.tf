terraform {
    backend "s3" {
        bucket="skope-aws-tf-state"
        key="staging/vpc/terraform.tfstate"
        dynamodb_table = "skope-aws-tf-locks"
        region="us-west-1"
        encrypt="true"
        }
}

provider "aws" {
    region = "us-west-1"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_vpc" "staging-vpc" {
    cidr_block = "${var.staging-vpc-address-space}"
    tags = {
       scope = "staging"
       Name = "staging-vpc"
    }
}

resource "aws_subnet" "staging-public-subnet" {
    cidr_block      = "${var.staging-public-subnet-address-space}"
    vpc_id          = "${aws_vpc.staging-vpc.id}"
    map_public_ip_on_launch = "true"
    tags = {
       scope = "staging"
       Name = "staging-public-subnet"
    }
}

resource "aws_subnet" "staging-private-subnet" {
    cidr_block      = "${var.staging-private-subnet-address-space}"
    vpc_id          = "${aws_vpc.staging-vpc.id}"
    map_public_ip_on_launch = "false"
    tags = {
       scope = "staging"
        Name = "staging-private-subnet"
    }
}
