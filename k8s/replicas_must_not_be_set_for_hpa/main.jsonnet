function(param)
  [
    {
      name: 'replicas must not be set',
      description: |||
        When an HPA is enabled, it is recommended that the value of spec.replicas of the Deployment and / or StatefulSet be removed from their manifest(s).
        If this isn't done, any time a change to that object is applied, for example via kubectl apply -f deployment.yaml, this will instruct Kubernetes to scale the current number of Pods to the value of the spec.replicas key.
        This may not be desired and could be troublesome when an HPA is active.
      |||,
      links: [
        {
          title: 'Migrating Deployments and StatefulSets to horizontal autoscaling',
          link: 'https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#migrating-deployments-and-statefulsets-to-horizontal-autoscaling',
        },
      ],
      location: {
        name: doc.metadata.name,
      },
    }
    for doc in param.data.value
    if doc.kind == 'Deployment' &&
     std.objectHas(doc.spec, 'replicas')
  ]
