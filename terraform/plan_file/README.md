# Terraform plan file

Lint Terraform plan files.

```sh
terraform plan -out tfplan.out
terraform show -json tfplan.out > tfplan.json
```

This example checks if [github_issue_label](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) has description.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "message": "github_issue_label description is required",
      "lint_file": "github_issue_label_description_is_required.jsonnet",
      "data_file": "tfplan.json",
      "location": {
        "label_name": "foo",
        "repository": "examples"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```
