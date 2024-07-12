# Customize Ouptput

https://lintnet.github.io/docs/guides/customize-output/

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
      "name": "description is required",
      "lint_file": "main.jsonnet",
      "data_file": "bar.json"
    },
    {
      "name": "description is required",
      "lint_file": "main.jsonnet",
      "data_file": "foo.json"
    }
  ]
}
```

## 1. Customize the JSON format with Jsonnet

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
```sh
lintnet lint -output jsonnet
```
```json
[
  {
    "errors": [
      {
        "data_file": "bar.json"
      },
      {
        "data_file": "bar.json"
      }
    ],
    "lint_file": "main.jsonnet",
    "name": "description is required"
  }
]
```

## 2. Transform data with Jsonnet and output the result with text/template

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
```sh
lintnet lint -output template
```
```


##  description is required

main.jsonnet
foo.json



##  description is required

main.jsonnet
bar.json


```

<!-- This file is generated by yodoc.
https://github.com/suzuki-shunsuke/yodoc
Please don't edit this code comment because yodoc depends on this code comment.
-->