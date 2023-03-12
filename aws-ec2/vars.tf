variable "AWS_REGION" {
    default = "ap-northeast-2"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "leedonggyu"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "leedonggyu.pub"
}

variable "AWS_ACCESS_KEY" {
    
}

variable "AWS_SECRET_KEY" {

}
 
variable "AMIS" {
    type = map(any)
    default = {
        ap-northeast-2 = "ami-0a6d611062244f7f3"
    }
}

