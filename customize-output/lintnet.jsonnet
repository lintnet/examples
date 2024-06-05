// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '*.json',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
  outputs: [
    {
      id: 'jsonnet',
      renderer: 'jsonnet',
      template: 'output.jsonnet',
    },
    {
      id: 'template',
      renderer: 'text/template',
      transform: 'transform.jsonnet',
      template: 'output.tpl',
    },
  ],
}
