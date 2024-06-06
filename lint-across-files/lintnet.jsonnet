// A configuration file of lintnet.
// https://lintnet.github.io/
function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/github-actions/workflow/workflow_name_must_be_unique/main_combine.jsonnet@eb941dd42ce4ec800588fb2b4d822c591dd54364:v0.2.0',
      ],
    },
  ],
}
