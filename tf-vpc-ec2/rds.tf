# RDS Subnet Group
resource "aws_db_subnet_group" "mariadb-subnet" {
    name = "mariadb-subnet"
    description = "MariaDB Subnet Group"
    subnet_ids = [
        "${aws_subnet.main-private-1.id}",
    ]
}

# RDS Setting Parameter
resource "aws_db_parameter_group" "mariadb-param" {
    name = "mariadb-param"
    family = "mariadb10.1"
    description = "MariaDB Parameter Group"

    parameter {
      name = "max_allowed_packet"
      value = "64M"
    }
}

# RDS Resource
resource "aws_db_instance" "mariadb" {
    allocated_storage = 100 # Default 100 -> IOPS Default
    engine = "mariadb"
    engine_version = "10.1.22"
    instance_class = "db.t2.micro"
    identifier = "mariadb"
    db_name="mariadb"
    username= "root"
    password = "${var.RDS_PASSWORD}"
    db_subnet_group_name = "${aws_db_subnet_group.mariadb-subnet.name}"
    parameter_group_name = "${aws_db_parameter_group.mariadb-param.name}"
    multi_az = false
    vpc_security_group_ids = ["${aws_security_group.allow-db.id}"]
    storage_type = "gp2"
    backup_retention_period = 30
    availability_zone = "${aws_subnet.main-private-1.availability_zone}"
}