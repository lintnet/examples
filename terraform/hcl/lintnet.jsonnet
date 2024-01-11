// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '**/*.tf',
        '!.terraform',
      ],
      lint_files: [
        'terraform_documented_outputs.jsonnet',
      ],
    },
  ],
}
