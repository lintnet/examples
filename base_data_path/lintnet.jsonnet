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
        'name_is_unique_combine.jsonnet',
      ],
    },
    {
      data_files: [
        '**/foo.json',
      ],
      lint_files: [
        'name_is_unique_combine.jsonnet',
      ],
    },
  ],
}
