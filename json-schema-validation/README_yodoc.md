---
dir: "{{.SourceDir}}"
---

# Validate with JSON Schema

This example validates lint rule's config parameter with JSON Schema ([draft 2020-12](https://json-schema.org/specification-links#2020-12)).

Please see [main.jsonnet](main.jsonnet).

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```
