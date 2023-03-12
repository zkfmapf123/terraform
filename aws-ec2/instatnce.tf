# aws_key_pair
resource "aws_key_pair" "leedonggyu" {
    key_name="leedonggyu"
    public_key="${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

# aws_instance
resource "aws_instance" "dev_server" {

    # 1. instance setting
    ami = "${var.AMIS[var.AWS_REGION]}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.leedonggyu.key_name}"

    # 2. VPC Setting
    subnet_id = "${aws_subnet.main-public-1.id}"

    # 3. Security Group
    vpc_security_group_ids = ["${aws_security_group.basic-sg.id}"]
    

    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh",
            "echo hello world",
            "echo ${aws_instance.dev_server.private_ip} > /tmp/private_ip}",
            "echo ${aws_instance.dev_server.public_ip} > /tmp/public_ip}"
        ]
    }

    connection {
      host = coalesce(self.public_ip, self.private_ip)
      type ="ssh"
      user = "ubuntu"
      private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
}