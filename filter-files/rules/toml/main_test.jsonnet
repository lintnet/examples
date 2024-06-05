// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.toml',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.toml',
    result: [
      {
        name: 'TOML requires the field "key"',
      },
    ],
  },
]
