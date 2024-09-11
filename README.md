# Project Name

This project deploys a Badgr instance on AWS using Terraform and Ansible.

## Prerequisites

Before you begin, ensure you have the following installed:

- Terraform [link](https://www.terraform.io/downloads.html)
- Ansible [link](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Getting Started

To get started with this project, follow these steps:

1. Create a new terraform variable file:

   ```bash
   cp terraform/terraform.tfvars-sample terraform/terraform.tfvars
   ```

2. Update the necessary variables in the `terraform.tfvars` file.

3. Initialize Terraform:

   ```bash
   cd terraform
   terraform init
   ```

4. Deploy the infrastructure:

   ```bash
   terraform plan
   terraform apply
   ```

5. Once the infrastructure is deployed, change into the `ansible` directory:

   ```bash
   cd ../ansible
   ```

6. Update the necessary variables in the `absible/vars/badgr_vars.yml` file.

7. Run the Ansible playbook to configure the Badgr instance:

   ```bash
   ansible-playbook playbook.yml
   ```

## License

This project is licensed under the [MIT License](LICENSE.md).
