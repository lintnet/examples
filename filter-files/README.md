# Filter files

First, please run `lintnet lint`.

```sh
lintnet lint
```

## Lint only given files

You can lint only give files.

```console
$ lintnet lint hello.toml
```

## Specify a target

You can lint only a given target.

```sh
lintnet lint -target csv
```

You can also combine file paths and target id.

```sh
$ lintnet lint -target csv hello.csv
```

## Test only specific files

If you run `lintnet test` without any argument, lintnet searches lint files with a configuration file and tests all lint files with test files.
But you can also test only specific files by specifying files as arguments.
If you specify files explicitly, a configuration file is unnecessary.
This means when you develop modules, you don't have to prepare a configuration file.

```sh
lintnet test
```

```sh
lintnet test rules/csv/main.jsonnet 
```

```sh
lintnet test rules/csv/main_test.jsonnet 
```

If you specify directories, lint files in those directories are tested.

```sh
lintnet test rules/csv             
```

```sh
lintnet test rules
```
