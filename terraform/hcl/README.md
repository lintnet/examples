# hcl

Lint Terraform configuration files `*.tf`.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "Disallow output declarations without description",
      "links": [
        {
          "link": "https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_outputs.md"
        }
      ],
      "lint_file": "terraform_documented_outputs.jsonnet",
      "data_file": "main.tf",
      "location": {
        "output_name": "foo"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```
