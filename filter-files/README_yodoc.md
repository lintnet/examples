---
dir: "{{.SourceDir}}"
---

# Filter files

First, please run `lintnet lint`.

```sh
#!yodoc run
lintnet lint
```

```json
{{.Stdout -}}
```

## Lint only given files

You can lint only give files.

```sh
#!yodoc run
lintnet lint hello.toml
```

```json
{{.Stdout -}}
```

## Specify a target

You can lint only a given target.

```sh
#!yodoc run
lintnet lint -target csv
```

```json
{{.Stdout -}}
```

You can also combine file paths and target id.

```sh
#!yodoc run
lintnet lint -target csv hello.csv
```

```json
{{.Stdout -}}
```

## Test only specific files

If you run `lintnet test` without any argument, lintnet searches lint files with a configuration file and tests all lint files with test files.
But you can also test only specific files by specifying files as arguments.
If you specify files explicitly, a configuration file is unnecessary.
This means when you develop modules, you don't have to prepare a configuration file.

```sh
#!yodoc run
lintnet test
```

<details>
<summary>Result</summary>

```
{{.CombinedOutput}}
```

</details>

```sh
#!yodoc run
lintnet test rules/csv/main.jsonnet 
```

<details>
<summary>Result</summary>

```
{{.CombinedOutput}}
```

</details>

```sh
#!yodoc run
lintnet test rules/csv/main_test.jsonnet 
```

<details>
<summary>Result</summary>

```
{{.CombinedOutput}}
```

</details>

If you specify directories, lint files in those directories are tested.

```sh
#!yodoc run
lintnet test rules/csv             
```

<details>
<summary>Result</summary>

```
{{.CombinedOutput}}
```

</details>

```sh
#!yodoc run
lintnet test rules
```

<details>
<summary>Result</summary>

```
{{.CombinedOutput}}
```

</details>
