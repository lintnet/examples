# Tutorial

1. [Set up](../README.md#set-up)
1. Scaffold a configuration file by `lintnet init`
1. Scaffold a lint file and a test file by `lintnet new`
1. Lint data files by `lintnet lint`
1. Test lint files by `lintnet test`
1. Use Modules

## Scaffold a configuration file by `lintnet init`

Please run `lintnet init`.

```sh
lintnet init
```

Then a configuration file `lintnet.jsonnet` is created.
If you want to hide the file, you can rename it to `.lintnet.jsonnet`.

## Scaffold a lint file and a test file by `lintnet new`

Please run `lintnet new`.

```sh
lintnet new
```

Then a lint file `main.jsonnet` and its test file `main_test.jsonnet` are created.

## Edit the configuration file

> [!NOTE]
> About configuration files, please see [the official document](https://lintnet.github.io/docs/config/) too.

You can see files [foo.json](foo.json), which is a data file linted by lintnet.
Please edit `lintnet.jsonnet` to lint `foo.json` with `main.jsonnet`.

```sh
cat > lintnet.jsonnet <<EOF
function(param) {
  targets: [
    {
      data_files: [
        // Glob is available
        // e.g. *.json, **/*.json
        'foo.json',
      ],
      lint_files: [
        // Glob is available
        'main.jsonnet',
      ],
    },
  ],
}
EOF
```

## Lint data files by `lintnet lint`

> [!NOTE]
> About lint rules, please see [the official document](https://lintnet.github.io/docs/lint-rule/) too.

Basically, you have to edit `main.jsonnet` after running `lintnet new`, but in this tutorial you don't have to edit this.

Please run `lintnet lint`.

`main.jsonnet` is a simple rule checking if data has a field `description`.
[foo.json](foo.json) doesn't have the field `description`, so `lintnet lint` would fail.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "description is required",
      "lint_file": "main.jsonnet",
      "data_file": "foo.json"
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

Please add the field `description` to `foo.json`.

```sh
cat > foo.json <<EOF
{
  "name": "hello",
  "description": "Hello, lintnet"
}
EOF
```

And rerun `lintnet lint`.
Then the command would succeed.

```console
$ lintnet lint # Output nothing
$ echo $?
0
```

## Test lint files by `lintnet test`

> [!NOTE]
> About testing, please see [the official document](https://lintnet.github.io/docs/test-rule/) too.

Basically, you have to edit `main_test.jsonnet` after running `lintnet new`, but in this tutorial you don't have to edit this.

Please create testdata for testing.

```sh
mkdir testdata
cat > testdata/pass.json <<EOF
{
  "name": "hello",
  "description": "Hello, lintnet"
}
EOF

: This testdata has a bug.
cat > testdata/fail.json <<EOF
{
  "name": "hello",
  "description": "Hello, lintnet"
}
EOF
```

The test file of `<A>.jsonnet` must be `<A>_test.jsonnet`.

Let's run `lintnet test` command.

```console
$ lintnet test
Test Name: fail
Lint file: main.jsonnet
Test file: main_test.jsonnet
Diff (- Expected + Actual)
  []any{
- 	map[string]any{"name": string("description is required")},
  }

==========
```

The test fails because the testdata is wrong.
Let's fix `testdata/fail.json`.

```sh
cat > testdata/fail.json <<EOF
{
  "name": "hello"
}
EOF
```

And run `lintnet test` again. Then the test succeeds.

```sh
$ lintnet test # Output nothing
$ echo $?
0
```

## Use Modules

> [!NOTE]
> About Modules, please see [the official document](https://lintnet.github.io/docs/module/) too.

In this tutorial, let's try an official Module [ghalint/action_ref_should_be_full_length_commit_sha](https://github.com/lintnet/modules/tree/main/modules/ghalint/action_ref_should_be_full_length_commit_sha).
This module checks if GitHub Actions action refs are full commit hash.

Move to [use-module](use-module).

```sh
cd use-module
```

Please see [lintnet.jsonnet](use-module/lintnet.jsonnet). The module is used.

```jsonnet
modules: [
  'github_archive/github.com/lintnet-modules/ghalint/workflow/action_ref_should_be_full_length_commit_sha/main.jsonnet@00571db321e413d45be457f39e48cd4237399bb7:v0.3.0',
],
```

Run `lintnet lint`. Then lint fails because the data file [.github/workflows/test.yaml](use-module/.github/workflows/test.yaml) violates the lint rule.

```sh
$ lintnet lint
INFO[0000] downloading a module                          env=darwin/arm64 module_id=github.com/lintnet/modules/805119063d195ffbafb3b0509704e5239741f86c program=lintnet version=
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "action's ref should be full length commit SHA",
      "lint_file": "github.com/lintnet/modules/805119063d195ffbafb3b0509704e5239741f86c/modules/ghalint/action_ref_should_be_full_length_commit_sha/main.jsonnet",
      "data_file": ".github/workflows/test.yaml",
      "location": {
        "job": "test",
        "uses": "actions/checkout@v4"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## See also

This tutorial described only basic things.
To learn further, please see [the document](https://lintnet.github.io/docs/) and [other examples](../README.md).
