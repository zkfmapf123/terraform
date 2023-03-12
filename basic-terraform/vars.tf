variable "AWS_ACCESS_KEY" {
  
}

variable "AWS_SECRET_KEY" {
    
}

variable "AWS_REGION" {
    default = "ap-northeast-2"
}

variable "SUBNET_ID" {
    
}

variable "PUBLIC_KEY_PATH" {
  
}

variable "PRIVATE_KEY_PATH" {

}

variable "AMIS" {
    type = map(any)
    default = {
        ap-northeast-2 = "ami-0a6d611062244f7f3"
    }
}