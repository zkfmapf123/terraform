## Docker tf Run
init:
	@terraform init

apply:
	@terraform apply

destory:
	@terraform destroy
run:
	make init
	make apply
