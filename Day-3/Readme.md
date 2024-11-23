# Terraform AWS EC2 and Security Groups
- This project uses Terraform to provision two AWS EC2 instances (Bastion and Test Instance) along with separate security groups for each instance. 
- The goal is to create a modular and reusable Terraform setup to manage EC2 instances and security groups with customizable ingress and egress rules.

## Overview
- **Bastion Instance**: An EC2 instance acting as a bastion host with specific security group settings (SSH access allowed from anywhere).
- **Test Instance**: An EC2 instance with a more complex security group, allowing multiple protocols and ports, such as HTTP, HTTPS, and custom TCP ranges.
- **Modular Design**: Security groups and EC2 instances are defined in separate modules, making the configuration reusable and easier to maintain.

## What We Are Doing
- Creating two EC2 instances using the provided AMI and instance types.
- Configuring separate security groups for each instance with customizable rules.
- Using parameterized modules for defining security groups and EC2 instances to make the setup flexible.

## How to Run the Project
### Configure AWS Credentials:

- Ensure your AWS credentials are set up either by configuring them in `~/.aws/credentials` or exporting the environment variables:

```bash
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
```

- Alternatively, you can use an AWS IAM role if running from an EC2 instance with the proper permissions.

**Initialize the Project**:

- Run the following command to initialize Terraform and download the necessary providers and modules:

```bash
terraform init
```

**Preview the Plan**:

- Before applying the configuration, you can preview the changes Terraform will make using:
```bash
terraform plan
```

**Apply the Configuration**:

- To create the EC2 instances and security groups, run the following command:
```bash
terraform apply
```

- Review the plan, and type `yes` to proceed with provisioning.

**Destroy the Resources**:

- When you're done, you can clean up and destroy the resources by running:
```bash
terraform destroy
```
