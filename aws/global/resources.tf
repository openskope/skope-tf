provider "aws" {
    region = "us-west-1"
    access_key = "${var.aws_access_key_id}"
    secret_key = "${var.aws_secret_access_key}"
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
        #prevent_destroy = true
    }
}