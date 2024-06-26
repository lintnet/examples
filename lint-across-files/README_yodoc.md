---
dir: "{{.SourceDir}}"
---

# lint across files

https://lintnet.github.io/docs/guides/lint-across-files/

Basically lintnet lints each data file independently.
But sometimes you need to lint across files.
For example, if you want to check if GitHub Actions workflow names are unique, you need to lint across all GitHub Actions workflow files.
So lintnet supports linting across multiple files.
If a lint file's name ends with `_combine.jsonnet`, the top level arguments of lint rule is changed.
Instead of `param.data`, `param.combined_data` are set.
`param.combined_data` is an array of data file.

e.g. [main_combine.jsonnet](https://github.com/lintnet-modules/github-actions/blob/main/workflow/workflow_name_must_be_unique/main_combine.jsonnet)

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```
