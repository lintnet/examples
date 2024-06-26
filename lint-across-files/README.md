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
lintnet lint
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "GitHub Actions workflow name must be unique",
      "description": "The duplicate of workflow names may cause issues.\n",
      "links": [
        {
          "title": "Module source",
          "link": "https://github.com/lintnet-modules/github-actions/blob/eb941dd42ce4ec800588fb2b4d822c591dd54364/workflow/workflow_name_must_be_unique/main_combine.jsonnet"
        }
      ],
      "lint_file": "github_archive/github.com/lintnet-modules/github-actions/eb941dd42ce4ec800588fb2b4d822c591dd54364/workflow/workflow_name_must_be_unique/main_combine.jsonnet:v0.2.0",
      "location": {
        "files": [
          ".github/workflows/foo.yaml",
          ".github/workflows/bar.yaml"
        ],
        "workflow_name": "foo"
      }
    }
  ]
}
```

<!-- This file is generated by yodoc.
https://github.com/suzuki-shunsuke/yodoc
Please don't edit this code comment because yodoc depends on this code comment.
-->
