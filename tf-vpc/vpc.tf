# VPC 
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16" # 10.0.0.0 ~ 10.0.255.255
    instance_tenancy = "default"
    enable_dns_support = true // DNS Support
    enable_dns_hostnames = true // DNS Hostname
    
    tags =  { 
        Name = "vpc_main"
    }
}

# Public Subnet
## 10.0.x.0/24 -> 1~3
resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2a"

    tags =  {
        Name = "main-public-1"
    }
}

resource "aws_subnet" "main-public-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2b"

    tags =  {
        Name = "main-public-2"
    }
}

resource "aws_subnet" "main-public-3" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2c"

    tags =  {
        Name = "main-public-3"
    }
}

# Private Subnet
## 10.0.x.0/24 -> 4~6
resource "aws_subnet" "main-private-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2a"

    tags =  {
        Name = "main-private-1"
    }
}

resource "aws_subnet" "main-private-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2b"

    tags =  {
        Name = "main-private-2"
    }
}

resource "aws_subnet" "main-private-3" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-2c"

    tags =  {
        Name = "main-private-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags =  {
        Name = "main-gw"
    }
}

# Route Table
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0" # Access All Traffic
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags =  { 
        Name = "main-public-rt"
    }
}

# Mappping Route Table == public subnet
resource "aws_route_table_association" "main-public-1" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}

resource "aws_route_table_association" "main-public-2" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}

resource "aws_route_table_association" "main-public-3" {
    subnet_id = "${aws_subnet.main-public-3.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}