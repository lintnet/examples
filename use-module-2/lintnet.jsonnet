function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        {
          path: 'github_archive/github.com/lintnet-modules/ghalint@0d6f9c5dbc856a70fca35511136d4f1c3195c872:v0.3.1',
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
