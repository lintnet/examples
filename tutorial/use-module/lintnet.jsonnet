function(param) {
  targets: [
    {
      data_files: [
        '.github/workflows/*.yml',
        '.github/workflows/*.yaml',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/ghalint/workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet@00571db321e413d45be457f39e48cd4237399bb7:v0.3.0',
      ],
    },
  ],
}
