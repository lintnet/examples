# Tutorial 2

1. [Filter files](#filter-files)
1. [Specify a target](#specify-a-target)
1. [Customize output](#customize-output)

First, please run `lintnet lint`.

```console
$ lintnet lint
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello-2.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "jo,5"
      }
    },
    {
      "name": "TOML requires the field \"name\"",
      "lint_file": "toml.jsonnet",
      "data_file": "hello.toml",
      "target_id": "toml"
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## Lint only given files

You can lint only give files.

```console
$ lintnet lint hello.toml
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "TOML requires the field \"name\"",
      "lint_file": "toml.jsonnet",
      "data_file": "hello.toml"
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## Specify a target

You can lint only a given target.

```console
$ lintnet lint -target csv
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello-2.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "jo,5"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

You can also combine file paths and target id.

```console
$ lintnet lint -target csv hello.csv
{
  "lintnet_version": "",
  "env": "darwin/arm64",
  "errors": [
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "/Users/shunsukesuzuki/repos/src/github.com/lintnet/examples/tutorial-2/hello.csv",
      "target_id": "csv",
      "location": {
        "index": 0,
        "line": "mike,10"
      }
    },
    {
      "name": "age must be greater or equal than 18",
      "lint_file": "csv.jsonnet",
      "data_file": "/Users/shunsukesuzuki/repos/src/github.com/lintnet/examples/tutorial-2/hello.csv",
      "target_id": "csv",
      "location": {
        "index": 1,
        "line": "alex,15"
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## Customize output

https://lintnet.github.io/docs/guides/customize-output/

### Customize the JSON format with Jsonnet

By default, lintnet outputs JSON when the lint fails.
You can custmize the JSON format with Jsonnet.
For example, you can put together errors of the same lint rule.

- [lintnet.jsonnet](lintnet.jsonnet)
- [output.jsonnet](output.jsonnet)

```jsonnet
  outputs: [
    {
      id: 'jsonnet',
      renderer: 'jsonnet',
      template: 'output.jsonnet',
    },
  ],
```

```console
$ lintnet lint -output jsonnet
lintnet lint -output jsonnet
[
  {
    "errors": [
      {
        "data_file": "hello.toml"
      }
    ],
    "lint_file": "toml.jsonnet",
    "name": "TOML requires the field \"name\""
  },
  {
    "errors": [
      {
        "data_file": "hello-2.csv",
        "location": {
          "index": 0,
          "line": "jo,5"
        }
      },
      {
        "data_file": "hello-2.csv",
        "location": {
          "index": 0,
          "line": "mike,10"
        }
      },
      {
        "data_file": "hello-2.csv",
        "location": {
          "index": 1,
          "line": "alex,15"
        }
      }
    ],
    "lint_file": "csv.jsonnet",
    "name": "age must be greater or equal than 18"
  }
]
FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

### Transform data with Jsonnet and output the result with text/template

You can customize the output with a template engine such as [text/template](https://pkg.go.dev/text/template) and [html/template](https://pkg.go.dev/html/template).
You can also customize the input data of the template engine with Jsonnet.

- [lintnet.jsonnet](lintnet.jsonnet)
- [transform.jsonnet](transform.jsonnet)
- [output.tpl](output.tpl)

```jsonnet
  outputs: [
    {
      id: 'template',
      renderer: 'text/template',
      transform: 'transform.jsonnet',
      template: 'output.tpl',
    },
  ],
```

```console
$ lintnet lint -output template


##  age must be greater or equal than 18

csv.jsonnet
hello-2.csv

{"index": 0, "line": "jo,5"}

##  age must be greater or equal than 18

csv.jsonnet
hello.csv

{"index": 0, "line": "mike,10"}

##  age must be greater or equal than 18

csv.jsonnet
hello.csv

{"index": 1, "line": "alex,15"}

##  TOML requires the field "name"

toml.jsonnet
hello.toml


FATA[0000] lintnet failed                                env=darwin/arm64 error=lint failed program=lintnet version=
```

## Test only specific files

If you run `lintnet test` without any argument, lintnet searches lint files with a configuration file and tests all lint files with test files.
But you can also test only specific files by specifying files as arguments.
If you specify files explicitly, a configuration file is unnecessary.
This means when you develop modules, you don't have to prepare a configuration file.

```console
$ lintnet test
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
  	map[string]any{"location": map[string]any{"index": float64(0), "line": string("mike,10")}, "name": string("age must be greater or equal than 18")},
  	map[string]any{
  		"location": map[string]any{
  			"index": float64(1),
- 			"line":  string("alex,14"),
+ 			"line":  string("alex,15"),
  		},
  		"name": string("age must be greater or equal than 18"),
  	},
  }

==========
Test Name: fail
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
- 	map[string]any{"name": string(`TOML requires the field "key"`)},
+ 	map[string]any{"name": string(`TOML requires the field "name"`)},
  }

==========

FATA[0000] lintnet failed                                env=darwin/arm64 error=test failed program=lintnet version=
```

```console
$ lintnet test rules/csv/main.jsonnet 
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
  	map[string]any{"location": map[string]any{"index": float64(0), "line": string("mike,10")}, "name": string("age must be greater or equal than 18")},
  	map[string]any{
  		"location": map[string]any{
  			"index": float64(1),
- 			"line":  string("alex,14"),
+ 			"line":  string("alex,15"),
  		},
  		"name": string("age must be greater or equal than 18"),
  	},
  }

==========

FATA[0000] lintnet failed                                env=darwin/arm64 error=test failed program=lintnet version=
```

```console
$ lintnet test rules/csv/main_test.jsonnet 
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
  	map[string]any{"location": map[string]any{"index": float64(0), "line": string("mike,10")}, "name": string("age must be greater or equal than 18")},
  	map[string]any{
  		"location": map[string]any{
  			"index": float64(1),
- 			"line":  string("alex,14"),
+ 			"line":  string("alex,15"),
  		},
  		"name": string("age must be greater or equal than 18"),
  	},
  }

==========

FATA[0000] lintnet failed                                env=darwin/arm64 error=test failed program=lintnet version=
```

If you specify directories, lint files in those directories are tested.

```console
$ lintnet test rules/csv             
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
  	map[string]any{"location": map[string]any{"index": float64(0), "line": string("mike,10")}, "name": string("age must be greater or equal than 18")},
  	map[string]any{
  		"location": map[string]any{
  			"index": float64(1),
- 			"line":  string("alex,14"),
+ 			"line":  string("alex,15"),
  		},
  		"name": string("age must be greater or equal than 18"),
  	},
  }

==========

FATA[0000] lintnet failed                                env=darwin/arm64 error=test failed program=lintnet version=
```

```console
$ lintnet test rules
Test Name: fail
Lint file: rules/csv/main.jsonnet
Test file: rules/csv/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
  	map[string]any{"location": map[string]any{"index": float64(0), "line": string("mike,10")}, "name": string("age must be greater or equal than 18")},
  	map[string]any{
  		"location": map[string]any{
  			"index": float64(1),
- 			"line":  string("alex,14"),
+ 			"line":  string("alex,15"),
  		},
  		"name": string("age must be greater or equal than 18"),
  	},
  }

==========
Test Name: fail
Lint file: rules/toml/main.jsonnet
Test file: rules/toml/main_test.jsonnet
Diff (- Expected + Actual)
  []any{
- 	map[string]any{"name": string(`TOML requires the field "key"`)},
+ 	map[string]any{"name": string(`TOML requires the field "name"`)},
  }

==========

FATA[0000] lintnet failed                                env=darwin/arm64 error=test failed program=lintnet version=
```
