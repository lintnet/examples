// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        'foo.json',
      ],
      lint_files: [
        {
          path: 'main.jsonnet',
          config: {
            excluded: ['foo'],
          },
        },
      ],
    },
  ],
}
