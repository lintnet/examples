// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      id: 'csv',
      data_files: [
        '*.csv',
      ],
      lint_files: [
        'rules/csv/main.jsonnet',
      ],
    },
    {
      id: 'toml',
      data_files: [
        '*.toml',
      ],
      lint_files: [
        'rules/toml/main.jsonnet',
      ],
    },
  ],
}
