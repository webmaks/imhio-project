# Short instruction.

Create new ssh key to authorize on the server:
```console
ssh-keygen -t rsa 
```
Copy created public key into file:
```console
vim terraform/key-pairs.tf 
```
Create infrastucture with Terraform on AWS:
```console
cd terraform 
terraform init
terraform plan
terraform apply
```
Install, setup MySQL Server and Application:
```console
cd ../ansible
```
Edit inventory file to specify servers:
```console
vim inventory
```
Run playbook:
```console
ansible-playbook -i inventory deploy.yml
```









