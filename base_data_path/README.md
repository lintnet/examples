# base_data_path

If you want to search files based on the other file, `base_data_path` is useful.

For example, let's say you want to test *.json which are on the same directory as `tfaction.yaml`.

```console
$ tree .
.
├── README.md
├── bar
│   ├── foo.json
│   └── tfaction.yaml
├── foo
│   ├── foo.json
│   └── tfaction.yaml
├── foo.json
├── lintnet.jsonnet
├── main.jsonnet
└── zoo
    └── foo.json

4 directories, 9 files

$ find . -name foo.json
./foo.json
./zoo/foo.json
./foo/foo.json
./bar/foo.json

$ find . -name tfaction.yaml
./foo/tfaction.yaml
./bar/tfaction.yaml
```

You want to test `foo/foo.json` and `bar/foo.json` but want to ignore `foo.json` and `bar/foo.json`.
In that case, you can use `base_data_path`.

```jsonnet
function(param) {
  targets: [
    {
      base_data_path: '**/tfaction.yaml',
      data_files: [
        // relative path from base_data_path
        // Glob is also available
        'foo.json',
      ],
      lint_files: [
        'main.jsonnet',
      ],
    },
  ],
}
```
