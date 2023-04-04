# AWS Key Pair를 활용하셔 Provisioning
resource "aws_key_pair" "leedonggyu" {
    key_name = "leedonggyu"
    public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"

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