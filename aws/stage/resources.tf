provider "aws" {
    region = "us-west-1"
    access_key = "${var.aws_access_key_id}"
    secret_key = "${var.aws_secret_access_key}"
}

resource "aws_vpc" "staging_vpc" {
    cidr_block = "${var.staging_vpc_address_space}"
    tags = {
        Name = "staging_vpc"
    }
}

resource "aws_subnet" "staging_public_subnet" {
    cidr_block      = "${var.staging_public_subnet_address_space}"
    vpc_id          = "${aws_vpc.staging_vpc.id}"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "staging_public_subnet"
    }
}

resource "aws_subnet" "staging_private_subnet" {
    cidr_block      = "${var.staging_private_subnet_address_space}"
    vpc_id          = "${aws_vpc.staging_vpc.id}"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "staging_private_subnet"
    }
}
