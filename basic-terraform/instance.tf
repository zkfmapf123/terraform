resource "aws_instance" "dev_server" {
    ami = "${var.AMIS[var.AWS_REGION]}"
    instance_type = "t2.micro"
}