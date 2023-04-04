# Common Security Group for EC2 instances
resource "aws_security_group" "allow-ssh" {
    vpc_id = "${aws_vpc.main.id}"
    name = "allow-ssh"
    description = "Security Group for SSH"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
 
    // ssh
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // http
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# RDS Security Group
resource "aws_security_group" "allow-db" {
    vpc_id = "${aws_vpc.main.id}"
    name = "allow-ssh"
    description = "Security Group for SSH"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // RDS
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}