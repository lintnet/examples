---
dir: "{{.SourceDir}}"
---

# replicas must be greater than threshold.

[main.jsonnet](main.jsonnet)

```jsonnet
{{Read "main.jsonnet" -}}
```

Lint k8s manifests.

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```
