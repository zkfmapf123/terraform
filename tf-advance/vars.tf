## AWS_KEY
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "eu-west-1"
}

variable "AMIS" {
    type = map(any)

    default ={
        "ap-northeast-2" = "ami-0a6d611062244f7f3"
    }
}

## AWS_PATH
variable "PATH_TO_PUBLIC_KEY" {}
variable "PATH_TO_PRIVATE_KEY" {}
variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}

## Env
variable "ENV" {
    default = "dev"
}