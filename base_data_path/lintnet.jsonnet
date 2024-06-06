// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      base_data_path: '**/tfaction.yaml',
      data_files: [
        'foo.json',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
}
