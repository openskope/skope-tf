

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

variable "staging_vpc_address_space" {
    default = "10.1.0.0/16"
}

variable "staging_public_subnet_address_space" {
    default = "10.1.0.0/24"
}

variable "staging_private_subnet_address_space" {
    default = "10.1.1.0/24"
}
