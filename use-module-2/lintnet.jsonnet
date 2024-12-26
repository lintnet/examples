function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        {
          path: 'github_archive/github.com/lintnet-modules/ghalint@12aac7476916a42e9de8646ac75c98274cfe8521:v0.3.2',
          files: [
            'workflow/**/main.jsonnet',
            '!workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet',
            {
              path: 'workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet',
              config: {
                excludes: [
                  'slsa-framework/slsa-github-generator/.github/workflows/generator_generic_slsa3.yml',
                ],
              },
            },
          ],
        },
      ],
    },
  ],
}
