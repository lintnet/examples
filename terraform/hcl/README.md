# hcl

Lint Terraform configuration files `*.tf`.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "message": "Disallow output declarations without description",
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
