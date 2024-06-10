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
