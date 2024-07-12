# replicas must be greater than threshold.

[main.jsonnet](main.jsonnet)

```jsonnet
local minimumReplicas = 2;
function(param)
  [
    {
      name: 'replicas must be greater than minimum value',
      location: {
        name: doc.metadata.name,
        replicas: std.get(doc.spec, 'replicas', 1),
        minimum_replicas: minimumReplicas,
      },
    }
    for doc in param.data.value
    if doc.kind == 'Deployment' &&
      std.get(doc.spec, 'replicas', 1) < minimumReplicas
  ]
```

Lint k8s manifests.

```sh
lintnet lint
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "replicas must be greater than minimum value",
      "lint_file": "main.jsonnet",
      "data_file": "deployment.yaml",
      "location": {
        "minimum_replicas": 2,
        "name": "nginx-deployment",
        "replicas": 1
      }
    }
  ]
}
```

<!-- This file is generated by yodoc.
https://github.com/suzuki-shunsuke/yodoc
Please don't edit this code comment because yodoc depends on this code comment.
-->