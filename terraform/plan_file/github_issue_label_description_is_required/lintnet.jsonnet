// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
}
