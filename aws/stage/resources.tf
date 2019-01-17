provider "aws" {
    region = "us-west-1"
    access_key = "${var.aws_access_key_id}"
    secret_key = "${var.aws_secret_access_key}"
}

resource "aws_vpc" "skope_staging_vpc" {
    cidr_block = "${var.skope_staging_vpc_address_space}"
}