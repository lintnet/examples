---
dir: "{{.SourceDir}}"
---

# base_data_path

If you want to search files based on the other file, `base_data_path` is useful.

For example, let's say you want to test *.json which are on the same directory as `tfaction.yaml`.

```sh
#-yodoc run
tree .
```

```
{{.CombinedOutput -}}
```

```sh
#-yodoc run
find . -name foo.json
```

```
{{.CombinedOutput -}}
```

```sh
#-yodoc run
find . -name tfaction.yaml
```

```
{{.CombinedOutput -}}
```

You want to test `foo/foo.json` and `bar/foo.json` but want to ignore `foo.json` and `bar/foo.json`.
In that case, you can use `base_data_path`.

```jsonnet
{{Read "lintnet.jsonnet" -}}
```
