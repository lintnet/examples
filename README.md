# examples

Examples of [lintnet](https://lintnet.github.io/).
You can learn lintnet by running commands according to examples.

- [Tutorial](tutorial)
- [Filter files](filter-files)
- [Lint k8s manifests](k8s)
- [Lint Terraform configuration files `*.tf` and Terraform plan files](terraform)
- [Validate data with JSON Schema](json-schema-validation)
- [Use third party Jsonnet libraries](jsonnet-library/xtd)
- [Use the `base_data_path` option](base_data_path)
- [Customize Output](customize-output)
- [Module](use-module-2)

## Set up

To run examples, you have to set up the environment first.
You only have to checkout this repository and [install lintnet](https://lintnet.github.io/docs/install/).

The most easiest way is to use [Development Containers](https://containers.dev/).
We provide [devcontainer.json](https://github.com/lintnet/examples/blob/main/.devcontainer/devcontainer.json) to set up the environment quickly.

Using [GitHub Codespaces](https://docs.github.com/en/codespaces/overview), you can set up the environment without installing anything on your laptop.

You can also use [Dev Container CLI](https://github.com/devcontainers/cli)

```sh
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . bash
```

If you use [aqua](https://aquaproj.github.io/), you can install lintnet by running `aqua i -l`.

## LICENSE

[MIT](LICENSE)
