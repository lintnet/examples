local array = import 'github_archive/github.com/jsonnet-libs/xtd/array.libsonnet@63d430b69a95741061c2f7fc9d84b1a778511d9c';

function(param) [
  {
    name: 'array.slice',
    custom: {
      array: array.slice(['foo', 'bar', 'zoo'], 1, 2),
    },
  },
]
