init:
	terraform init

plan:
	terraform plan -var-file vars.tfvars

apply:
	terraform apply -var-file vars.tfvars

output: 
	terraform output