variable "access_key" {}
variable "secret_key" {}

variable "staging-vpc-address-space" {
    default = "10.1.0.0/16"
}

variable "staging-public-subnet-address-space" {
    default = "10.1.0.0/24"
}

variable "staging-private-subnet-address-space" {
    default = "10.1.1.0/24"
}
