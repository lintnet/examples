// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '**/*.tf',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
}
