---
dir: "{{.SourceDir}}"
---

# Terraform plan file

Lint Terraform plan files.

```sh
terraform plan -out tfplan.out
terraform show -json tfplan.out > tfplan.json
```

This example checks if [github_issue_label](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) has description.

Regarding the format of plan files, please see [JSON Output Format](https://developer.hashicorp.com/terraform/internals/json-format#plan-representation).

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```
