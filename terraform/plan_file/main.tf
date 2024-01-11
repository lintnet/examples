terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {}

resource "github_issue_label" "test_repo" {
  repository = "examples"
  name       = "foo"
  color      = "FF0000"
}
