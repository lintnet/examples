// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        'deployment.yaml',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
}
