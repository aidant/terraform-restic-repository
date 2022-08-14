# Terraform Restic Repository

## Quick Setup

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25.0"
    }
  }
}

module "restic_repository" {
  source  = "github.com/aidant/terraform-restic-repository"
}
```
