# Customize Ouptput

https://lintnet.github.io/docs/guides/customize-output/

First, please run `lintnet lint`.

```sh
lintnet lint
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
