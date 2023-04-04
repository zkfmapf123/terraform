# resource "aws_instance" "vpc-ec2" {
#     ami = "${lookup(var.AMIS, var.AWS_REGION)}"
#     instance_type = "t2.micro"
# }