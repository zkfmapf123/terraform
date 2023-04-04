# AWS Key Pair를 활용하셔 Provisioning
resource "aws_key_pair" "leedonggyu" {
    key_name = "leedonggyu"
    public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # Use DEV OR PROD 
    subnet_id = "${var.ENV == "prod" ? module.vpc-prod.public_subnets[0] : module.vpc-dev.public_subnets[0]}"

    # USE DEV OR PROD
    vpc_security_group_ids = [
        "${var.ENV == "prod" ? module.sg-prod.allow-ssh.id : module.sg-dev.allow-ssh.id}"
    ]

    # File Upload
    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    # Execute Script
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh"
        ]
    }

    # AWS KEY CONNECTION
    connection {
      host=coalesce(self.public_ip, self.private_ip) # public_ip ? public_ip : private_ip  
      type="ssh"
      user = "${var.INSTANCE_USERNAME}"
      private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
}