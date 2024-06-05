// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.csv',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.csv',
    result: [
      {
        name: 'age must be greater or equal than 18',
        location: {
          index: 0,
          line: 'mike,10',
        },
      },
      {
        name: 'age must be greater or equal than 18',
        location: {
          index: 1,
          line: 'alex,14',
        },
      },
    ],
  },
]
