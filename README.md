# Terraform practice

## Execute

```
    brew install hashicorp/tap/terraform
    brew update

    terraform --version
    terraform -help
```

## Command

```
    terraform init
    terraform apply
    terraform destroy
    terraform plan
    terraform plan -out out.terraform

    - SSH KEY : SSH KEY 만들기
    ssh-keygen -f name

    - AWS 자격증명 확인
    cat ~/.aws/credentials
```

## Basic-Terraform

- terraform-versioning (.tfstate)

## aws-ec2

![scrennshot](./aws-ec2/public/vpc.jpg)

## Refernece

- https://cloud-images.ubuntu.com/locator/ec2/
