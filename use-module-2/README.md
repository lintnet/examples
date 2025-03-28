# Use Module

There are several styles to use modules.

## 1. string style

This is the simplest style.

```jsonnet
{
  modules: [
    'github_archive/github.com/lintnet-modules/ghalint/workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet@c311ef7a7e3acdfb8a65136b7852e0619be84c1d:v0.3.3',
  ],
}
```

## 2.1. Object style

```jsonnet
{
  modules: [
    {
      path: 'github_archive/github.com/lintnet-modules/ghalint/workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet@c311ef7a7e3acdfb8a65136b7852e0619be84c1d:v0.3.3',
    },
  ],
}
```

Object style supports passing `config` parameter.

```jsonnet
{
  modules: [
    {
      path: 'github_archive/github.com/lintnet-modules/ghalint/workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet@c311ef7a7e3acdfb8a65136b7852e0619be84c1d:v0.3.3',
      config: {
        excludes: [
          'slsa-framework/slsa-github-generator/.github/workflows/generator_generic_slsa3.yml',
        ],
      },
    },
  ],
}
```

## 2.2. `files`

You can specify file paths in a module with the attriute `files`.
This style is useful to specify multiple file path patterns in a module and set `config` parameter by lint rule.

```jsonnet
{
  modules: [
    {
      path: 'github_archive/github.com/lintnet-modules/ghalint@c311ef7a7e3acdfb8a65136b7852e0619be84c1d:v0.3.3',
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
}
```
