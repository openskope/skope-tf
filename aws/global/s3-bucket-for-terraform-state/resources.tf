terraform {
    backend "s3" {
        bucket="skope-aws-tf-state"
        key="global/s3-bucket-for-terraform-state/terraform.tfstate"
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

resource "aws_dynamodb_table" "skope-aws-tf-locks" {

    name = "skope-aws-tf-locks"
    billing_mode   = "PROVISIONED"
    read_capacity  = 1
    write_capacity = 1

   hash_key = "LockID"

   attribute {
      name = "LockID"
      type = "S"
   }

    tags = {
        scope = "global"
    }

    lifecycle {
        prevent_destroy = true
    }
}
resource "aws_s3_bucket" "skope-aws-tf-state" {  
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
