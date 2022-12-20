terraform {
  cloud {
    organization = "prafect"

    workspaces {
      name = "devops-aws-myapp-dev"
    }
  }
}