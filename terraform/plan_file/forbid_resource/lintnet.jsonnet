// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      lint_files: [
        {
          path: 'main.jsonnet',
          config: {
            forbidden_resource_types: ['google_secret_manager_secret_version'],
          },
        },
      ],
    },
  ],
}
