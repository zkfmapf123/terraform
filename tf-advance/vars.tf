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