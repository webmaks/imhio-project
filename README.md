Short instruction.

Create new ssh key to authorize on the server:
ssh-keygen -t rsa 
Copy created public key into file:
vim terraform/key-pairs.tf 
Create infrastucture with Terraform on AWS:
cd terraform 
terraform init
terraform plan
terraform apply
Install, setup MySQL Server and Application.
cd ../ansible
ansible-playbook -i inventory deploy.yml










