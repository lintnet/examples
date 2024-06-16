# Filter files

First, please run `lintnet lint`.

```sh
lintnet lint
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello-2.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "jo,5"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    },
    {
      "name": "TOML requires the field \"name\"",
      "lint_file": "rules/toml/main.jsonnet",
      "data_file": "hello.toml",
      "target_id": "toml"
    }
  ]
}
```

## Lint only given files

You can lint only give files.

```sh
lintnet lint hello.toml
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "TOML requires the field \"name\"",
      "lint_file": "rules/toml/main.jsonnet",
      "data_file": "hello.toml"
    }
  ]
}
```

## Specify a target

You can lint only a given target.

```sh
lintnet lint -target csv
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello-2.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "jo,5"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    }
  ]
}
```

You can also combine file paths and target id.

```sh
lintnet lint -target csv hello.csv
```
```json
{
  "lintnet_version": "0.4.7",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "/Users/shunsukesuzuki/repos/src/github.com/lintnet/examples/filter-files/hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "rules/csv/main.jsonnet",
      "data_file": "/Users/shunsukesuzuki/repos/src/github.com/lintnet/examples/filter-files/hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    }
  ]
}
```

## Test only specific files

If you run `lintnet test` without any argument, lintnet searches lint files with a configuration file and tests all lint files with test files.
But you can also test only specific files by specifying files as arguments.
If you specify files explicitly, a configuration file is unnecessary.
This means when you develop modules, you don't have to prepare a configuration file.

```sh
lintnet test
```

<details>
<summary>Result</summary>

```
Test Name: pass
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/pass.csv: no such file or directory
==========
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/fail.csv: no such file or directory
==========
Test Name: pass
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Error: read a data file: read a file: open rules/toml/testdata/pass.toml: no such file or directory
==========
Test Name: fail
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Error: read a data file: read a file: open rules/toml/testdata/fail.toml: no such file or directory
==========

time=2024-06-16T15:17:40+09:00 level=fatal msg=lintnet failed env=darwin/arm64 error=test failed program=lintnet version=0.4.7

```

</details>

```sh
lintnet test rules/csv/main.jsonnet 
```

<details>
<summary>Result</summary>

```
Test Name: pass
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/pass.csv: no such file or directory
==========
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/fail.csv: no such file or directory
==========

time=2024-06-16T15:17:40+09:00 level=fatal msg=lintnet failed env=darwin/arm64 error=test failed program=lintnet version=0.4.7

```

</details>

```sh
lintnet test rules/csv/main_test.jsonnet 
```

<details>
<summary>Result</summary>

```
Test Name: pass
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/pass.csv: no such file or directory
==========
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/fail.csv: no such file or directory
==========

time=2024-06-16T15:17:40+09:00 level=fatal msg=lintnet failed env=darwin/arm64 error=test failed program=lintnet version=0.4.7

```

</details>

If you specify directories, lint files in those directories are tested.

```sh
lintnet test rules/csv             
```

<details>
<summary>Result</summary>

```
Test Name: pass
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/pass.csv: no such file or directory
==========
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/fail.csv: no such file or directory
==========

time=2024-06-16T15:17:40+09:00 level=fatal msg=lintnet failed env=darwin/arm64 error=test failed program=lintnet version=0.4.7

```

</details>

```sh
lintnet test rules
```

<details>
<summary>Result</summary>

```
Test Name: pass
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/pass.csv: no such file or directory
==========
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Error: read a data file: read a file: open rules/csv/testdata/fail.csv: no such file or directory
==========
Test Name: pass
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Error: read a data file: read a file: open rules/toml/testdata/pass.toml: no such file or directory
==========
Test Name: fail
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Error: read a data file: read a file: open rules/toml/testdata/fail.toml: no such file or directory
==========

time=2024-06-16T15:17:40+09:00 level=fatal msg=lintnet failed env=darwin/arm64 error=test failed program=lintnet version=0.4.7

```

</details>

<!-- This file is generated by yodoc.
https://github.com/suzuki-shunsuke/yodoc
Please don't edit this code comment because yodoc depends on this code comment.
-->
