function(param) {
  targets: [
    {
      // lint_files: [
      //   'main.jsonnet',
      // ],
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        'github.com/lintnet/modules/modules/ghalint/action_ref_should_be_full_length_commit_sha/main.jsonnet@805119063d195ffbafb3b0509704e5239741f86c:v0.1.0',
      ],
    },
  ],
}
