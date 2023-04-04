# 1. AWS INSTANCE
resource "aws_instance" "vpc-ec2" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # 1. 1) VPC subnet
    subnet_id = "${aws_subnet.main-public-1.id}"

    # 1. 2) Security Group
    vpc_security_group_ids = [
        "${aws_security_group.allow-ssh.id}"
    ]

    # 1. 3) Public SSH Key
    key_name = "${aws_key_pair.mykeypair.key_name}"

    # 1. 4) Connect Elastic IP
    private_ip = "10.0.1.4"
}

# 2. AWS EBS
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "${aws_instance.vpc-ec2.availability_zone}"
    size = 20
    type = "gp2"
    tags = {
        Name = "ebs_volume-1"
    }
}

# 3. Elastic IP
resource "aws_eip" "vpc-ec2-eip" {
    instance = "${aws_instance.vpc-ec2.id}"
    vpc = true
}

# Mapping AWS Instance And AWS EBS
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
    instance_id = "${aws_instance.vpc-ec2.id}"
}