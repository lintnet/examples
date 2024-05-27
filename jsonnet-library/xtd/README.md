# Use third party Jsonnet libraries

This is an example to use third party Jsonnet libraries.

In this example we use the library https://github.com/jsonnet-libs/xtd .
This library has nothing to do with lintnet at all, but lintnet can utilize this kind of libraries.

[hello.jsonnet](hello.jsonnet)

```jsonnet
local array = import 'github_archive/github.com/jsonnet-libs/xtd/array.libsonnet@63d430b69a95741061c2f7fc9d84b1a778511d9c';

function(param) [
  {
    name: 'array.slice',
    custom: {
      array: array.slice(['foo', 'bar', 'zoo'], 1, 2),
    },
  },
]
```

```console
$ lintnet lint
INFO[0000] downloading a module                          env=darwin/arm64 program=lintnet version=
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "array.slice",
      "lint_file": "hello.jsonnet",
      "data_file": "hello.json",
      "custom": {
        "array": [
          "bar"
        ]
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```
