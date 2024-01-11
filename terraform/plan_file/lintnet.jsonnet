// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      lint_files: [
        'github_issue_label_description_is_required.jsonnet',
      ],
    },
  ],
}
