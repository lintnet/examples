// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        'deployment.yaml',
      ],
      lint_files: [
        'replicas_must_not_be_set.jsonnet',
      ],
    },
  ],
}
