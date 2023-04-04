# Define Iam Role for EC2
resource "aws_iam_role" "app-ec2-role" {
    name = "app-ec2-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "app-ec2-role" {
    name = "app-ec2-role"
    role = aws_iam_role.app-ec2-role.name
}

# Service
resource "aws_iam_role" "elb-service-role" {
    name = "elb-service-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elasticloadbalancing.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
EOF

}

# policies
resource "aws_iam_policy_attachment" "app-attach-1" {
    name = "app-attach-1"
    role = [aws_iam_role.app-ec2-role.name]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_policy_attachment" "app-attach-2" {
    name = "app-attach-2"
    role = [aws_iam_role.app-ec2-role.name]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_policy_attachment" "app-attach-3" {
name       = "app-attach-3"
roles      = [aws_iam_role.app-ec2-role.name]
policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_policy_attachment" "app-attach-4" {
name       = "app-attach-4"
roles      = [aws_iam_role.elasticbeanstalk-service-role.name]
policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}