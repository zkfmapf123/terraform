resource "aws_ssm_parameter" "myparams" {
    name = "/myapp/myparams"
    type = "String"
    value = "myparams"
}
