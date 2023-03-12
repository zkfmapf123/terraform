## Resource > Example > IF
resource "aws_instance" "example" {
    ami           = "ami-2757f631"
    instance_type = "t2.micro"

    subnet_id = "${var.ENV == "prod" ? module.vpc-prod.public_subnets[0] : module.vpc-dev.public_subnets[0]}"
}


## SecurityGroup > Example > For
resource "aws_security_group" "example" {
    name = "example"

    // for (const ingress of [22,8080])
    // ingress.value
    dynamic "ingress" {
        for_each = [22,8080]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
        }
    }
}