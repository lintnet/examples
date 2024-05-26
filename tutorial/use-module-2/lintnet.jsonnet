function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        {
          path: 'github_archive/github.com/lintnet-modules/ghalint@b2b06cb862255b4516ee33cd328718186393878d:v0.1.0',
          files: [
            '**/main.jsonnet',
            '!action_ref_should_be_full_length_commit_sha/main.jsonnet',
            {
              path: 'action_ref_should_be_full_length_commit_sha/main.jsonnet',
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
