# tf-gcp-infra

This project is Infrastructure as Code (IaC) for Google Cloud Platform (GCP) using Terraform.

## Overview

The purpose of this project is to demonstrate how to provision and manage GCP resources using Terraform. By defining infrastructure as code, you can version control your infrastructure, automate its deployment, and ensure consistency across environments.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository: `git clone https://github.com/Cloud-Webapp-Shantanu/tf-gcp-infra.git`
2. Change into the project directory: `cd tf-gcp-infra`
3. Install Terraform: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
4. Install gcp CLI: [Install the gcloud CLI](https://cloud.google.com/sdk/docs/install)
6. Customize the Terraform configuration files according to your requirements.
7. Initialize the Terraform workspace: `terraform init`
8. Review the planned changes: `terraform plan`
9. Apply the changes: `terraform apply`
10. Destroy the infra: `terraform destroy`
    
## Github Workflow

Github Workflow to validate terraform on pull request: .github/workflows/validation-workflow.yml
