// ingress 규칙은 인바운드 규칙을 의미하며, egress 규칙은 아웃바운드 규칙을 의미한다.
resource "aws_security_group" "basic-sg" {
    vpc_id = aws_vpc.main.id
    name = "basic-sg"
    description = "Allow SSH inbound traffic"

    egress {
        from_port = 0  // 모든 포트
        to_port = 0 // 모든 포트
        protocol = "-1" // 모든 프로토콜
        cidr_blocks = ["0.0.0.0/0"] // 모든 IP에 대해 허용
    }

    // SSH 접속을 위한 인바운드 규칙
    ingress {   
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // HTTP 접속을 위한 인바운드 규칙
    ingress {
        from_port = 8080
        to_port = 8080
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name="allow-ssh"
    }
}