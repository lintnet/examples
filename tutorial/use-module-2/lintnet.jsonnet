function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        {
          path: 'github_archive/github.com/lintnet/modules@d69d0083dcb2696dd3427c484f36940f717a9285:v0.1.2',
          files: [
            'modules/ghalint/**/main.jsonnet',
            '!modules/ghalint/deny_read_all_permission/main.jsonnet',
            {
              path: 'modules/ghalint/action_ref_should_be_full_length_commit_sha/main.jsonnet',
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
