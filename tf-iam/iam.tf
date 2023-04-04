resource "aws_iam_group" "test_admin" {
    name = "test_admin"
}

resource "aws_iam_policy_attachment" "test-admin-attachment" {
    name = "test-admin-attachment"
    groups = ["${aws_iam_group.test_admin.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# user_1
resource "aws_iam_user" "dev_leedonggyu" {
    name = "dev_leedonggyu"
}

# user_2
resource "aws_iam_user" "dev_limjeahyock" {
    name = "dev_limjeahyock"
}

resource "aws_iam_group_membership" "test-admin-users" {
    name = "test-admin-users"
    users = [
        "${aws_iam_user.dev_leedonggyu.name}",
        "${aws_iam_user.dev_limjeahyock.name}"
    ]

    group = "${aws_iam_group.test_admin.name}"
}