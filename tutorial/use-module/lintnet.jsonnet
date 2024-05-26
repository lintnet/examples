function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/ghalint/action_ref_should_be_full_length_commit_sha/main.jsonnet@b2b06cb862255b4516ee33cd328718186393878d:v0.1.0',
      ],
    },
  ],
}
