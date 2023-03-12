# Common VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"     // 10.0.0.0 ~ 10.0.255.255
  instance_tenancy = "default"   // 모든 인스턴스에 기본 테넌시 존재
  enable_dns_support = true      // DNS 지원 여부
  enable_dns_hostnames = true    // DNS 호스트네임 지원 여부
  enable_classiclink = false     // 클래식 링크 지원 여부
  tags  = {
    Name = "main"
  }
}

# Public Subnet
resource "aws_subnet" "main-public-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "main-public-2"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "main-public-3"
  }
}

# Private Subnet
resource "aws_subnet" "main-private-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = false // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "main-private-2"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = false // 인스턴스 시작시 자동으로 공인 IP 할당
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "main-private-3"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-gw"
  }
}

# Route Table
resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  
  tags ={
    Name = "main-public-rt"
  }
}

# route table association
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public-rt.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public-rt.id
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public-rt.id
}