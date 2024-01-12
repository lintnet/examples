# k8s manifests

Lint k8s manifests.

e.g.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "replicas must not be set",
      "description": "When an HPA is enabled, it is recommended that the value of spec.replicas of the Deployment and / or StatefulSet be removed from their manifest(s).\nIf this isn't done, any time a change to that object is applied, for example via kubectl apply -f deployment.yaml, this will instruct Kubernetes to scale the current number of Pods to the value of the spec.replicas key.\nThis may not be desired and could be troublesome when an HPA is active.\n",
      "links": [
        {
          "title": "Migrating Deployments and StatefulSets to horizontal autoscaling",
          "link": "https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#migrating-deployments-and-statefulsets-to-horizontal-autoscaling"
        }
      ],
      "lint_file": "replicas_must_not_be_set.jsonnet",
      "data_file": "deployment.yaml",
      "location": {
        "name": "nginx-deployment"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```
