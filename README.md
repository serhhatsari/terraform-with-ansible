## Description  
In this project, I used Ansible and Terraform together to create (Terraform) and configure (Ansible) a droplet in Digital Ocean.

## Usage  

Initialize a working directory containing Terraform configuration files:    
`terraform init`    

  
   
Create an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure:  
`terraform plan`   
   
   
 Executes the actions proposed in a Terraform plan:  
`terraform apply`  
  
Then you can run the Ansible playbooks to configure the droplets:  
`ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i ./inventory/hosts.ini --private-key ~/.ssh/id_rsa --become-user=root  main.yml` 


* While the droplets are being created, inventory file of ansible will also be created.  
