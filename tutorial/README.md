# Tutorial

1. Checkout this repository
1. [Install lintnet](https://lintnet.github.io/docs/install/)
1. Scaffold configuration file by `lintnet init`
1. Edit the configuration file
1. Lint data files by `lintnet lint`
1. Fix data files and run lintnet again
1. Test lint files
1. Use Modules

## Checkout the repository

```sh
git clone https://github.com/lintnet/examples
cd examples/tutorial
```

If you use [aqua](https://aquaproj.github.io/), you can install lintnet by `aqua i -l`

```sh
aqua i -l
```

## Scaffold configuration file by `lintnet init`

Please run `lintnet init`.

```sh
lintnet init
```

Then a configuration file `lintnet.jsonnet` is created.

## Edit the configuration file

> [!NOTE]
> About configuration files, please see [the official document](https://lintnet.github.io/docs/config/) too.

You can see files [foo.json](foo.json) and [hello.jsonnet](hello.jsonnet).

- `foo.json`: data file linted by lintnet
- `hello.jsonnet`: lint file linting hello.json

Please edit `lintnet.jsonnet` to lint `foo.json` with `hello.jsonnet`.

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
        'hello.jsonnet',
      ],
    },
  ],
}
EOF
```

## Lint a data file by `lintnet lint`

> [!NOTE]
> About lint rules, please see [the official document](https://lintnet.github.io/docs/lint-rule/) too.

Please run `lintnet lint`.

[hello.jsonnet](hello.jsonnet) is a simple rule checking if data has a field `description`.
[foo.json](foo.json) doesn't have the field `description`, so `lintnet lint` would fail.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "description is required",
      "lint_file": "hello.jsonnet",
      "data_file": "foo.json"
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## Fix a data file and run lintnet again

Please fix `foo.json` to add the field `description`.

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

## Test the lint file

> [!NOTE]
> About testing, please see [the official document](https://lintnet.github.io/docs/test-rule/) too.

You can see a test file [hello_test.jsonnet](hello_test.jsonnet) and testdata [testdata/*](testdata).
The test file of `<A>.jsonnet` must be `<A>_test.jsonnet`.

Let's run `lintnet test` command to test [hello.jsonnet](hello.jsonnet).

```console
$ lintnet test
Test Name: fail
Lint file: hello.jsonnet
Test file: hello_test.jsonnet
Diff (- Expected + Actual)
  []any{
+ 	map[string]any{"name": string("description is required")},
  }

==========
```

The test fails because the test file is wrong.
Let's fix `hello_test.jsonnet`.
A test file is a list of pairs of an input of the lint file and an expected result.

```sh
cat > hello_test.jsonnet <<EOF
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.json',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.json',
    result: [
      {   
        name: 'description is required', 
      },   
    ],
  },
]
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

You can use Modules.
Using Modules, you don't need to write lint rules and tests yourself.
You can also distribute lint rules as both OSS and in-house libraries.

In this tutorial, let's try an official Module [ghalint/action_ref_should_be_full_length_commit_sha](https://github.com/lintnet/modules/tree/main/modules/ghalint/action_ref_should_be_full_length_commit_sha).
This module checks if GitHub Actions action refs are full commit hash.

Move to [use-module](use-module).

```sh
cd use-module
```

Please see [lintnet.jsonnet](use-module/lintnet.jsonnet). The module is used.

```jsonnet
      modules: [
        'github.com/lintnet/modules/modules/ghalint/action_ref_should_be_full_length_commit_sha/main.jsonnet@805119063d195ffbafb3b0509704e5239741f86c:v0.1.1',
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

- [Tutorial 2](../tutorial-2)
- [Lint k8s manifests](../k8s)
- [Lint Terraform configurations](../terraform)
