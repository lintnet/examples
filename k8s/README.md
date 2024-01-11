# k8s manifests

Lint k8s manifests.

e.g.

```console
$ lintnet lint
{
  "lintnet_version": "0.2.0",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "replicas must not be set",
      "lint_file": "replicas_must_not_be_set.jsonnet",
      "data_file": "deployment.yaml",
      "location": {
        "name": "nginx-deployment"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=0.2.0
```
