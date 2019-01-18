terraform {
    backend "s3" {
        bucket="skope-aws-tf-state"
        key="global/s3/terraform.tfstate"
        region="us-west-1"
        encrypt="true"
        }
}

provider "aws" {
    region = "us-west-1"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}
resource "aws_s3_bucket" "skope_aws_state" {  
    bucket = "skope-aws-tf-state"  
    tags = {
        scope = "global"
    }
    versioning {
        enabled = true
    }
    lifecycle {
        prevent_destroy = true
    }
}
