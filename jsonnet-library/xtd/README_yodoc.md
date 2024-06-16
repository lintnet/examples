---
dir: "{{.SourceDir}}"
---

# Use third party Jsonnet libraries

This is an example to use third party Jsonnet libraries.

In this example we use the library https://github.com/jsonnet-libs/xtd .
This library has nothing to do with lintnet at all, but lintnet can utilize this kind of libraries.

[hello.jsonnet](hello.jsonnet)

```jsonnet
{{Read "hello.jsonnet" -}}
```

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```
