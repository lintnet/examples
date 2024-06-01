# Validate with JSON Schema

This example validates lint rule's config parameter with JSON Schema ([draft 2020-12](https://json-schema.org/specification-links#2020-12)).

Please see [main.jsonnet](main.jsonnet).

```console
$ lintnet lint
{
  "lintnet_version": "0.4.0",
  "env": "linux/arm64",
  "errors": [
    {
      "name": "description is required",
      "message": "config is invalid",
      "lint_file": "main.jsonnet",
      "data_file": "foo.json",
      "custom": {
        "errors": {
          "absoluteKeywordLocation": "file:///workspaces/examples/json-schema-validation#",
          "errors": [
            {
              "absoluteKeywordLocation": "file:///workspaces/examples/json-schema-validation#/required",
              "error": "missing properties: 'name'",
              "instanceLocation": "",
              "keywordLocation": "/required",
              "valid": false
            },
            {
              "absoluteKeywordLocation": "file:///workspaces/examples/json-schema-validation#/additionalProperties",
              "error": "additionalProperties 'excluded' not allowed",
              "instanceLocation": "",
              "keywordLocation": "/additionalProperties",
              "valid": false
            }
          ],
          "instanceLocation": "",
          "keywordLocation": "",
          "valid": false
        }
      }
    }
  ]
}
FATA[0000] lintnet failed                                env=linux/arm64 error=lint failed program=lintnet version=0.4.0
```
