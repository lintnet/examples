# base_data_path

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "description is required",
      "lint_file": "main.jsonnet",
      "data_file": "bar/foo.json"
    },
    {
      "name": "description is required",
      "lint_file": "main.jsonnet",
      "data_file": "foo/foo.json"
    },
    {
      "name": "name must be unique",
      "lint_file": "name_is_unique_combine.jsonnet",
      "location": {
        "files": [
          "foo.json",
          "bar/foo.json",
          "foo/foo.json"
        ],
        "name": "foo"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```
