// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.json',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.json',
    result: [
      {
        name: 'description is required',
      },
    ],
  },
]
