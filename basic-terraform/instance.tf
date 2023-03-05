# 1. aws_key_pari
# - ssh keygen으로 생성한 public key를 이용하여 aws key pair 생성
resource "aws_key_pair" "zkfmapf123" {
    key_name="zkfmapf123"
    public_key= "${file("${var.PUBLIC_KEY_PATH}")}"
}

# 2.aws instance
# - ami는 ap-northeast-2 region의 ami id
resource "aws_instance" "dev_server" {
    ami = "${var.AMIS[var.AWS_REGION]}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.zkfmapf123.key_name}"  

    # Provisioner file
    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    # Provisioner remote-exec
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh",
            "echo hello world"
        ]
    }

    # connection ssh use file or exec
    connection {
        host = coalesce(self.public_ip, self.private_ip)
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
} 