// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.json',
    param: {
      config: {
        forbidden_resource_types: ['google_secret_manager_secret_version'],
      },
    },
    result: [],
  },
  {
    name: 'forbidden_resource_types is required',
    data_file: 'testdata/fail.json',
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "forbidden_resource_types" is required',
      },
    ],
  },
  {
    name: 'The config "forbidden_resource_types" must be an array',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        forbidden_resource_types: 'hello',
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "forbidden_resource_types" must be an array',
        custom: {
          forbidden_resource_types: 'hello',
        },
      },
    ],
  },
  {
    name: 'The config "forbidden_resource_types" must be an array of string',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        forbidden_resource_types: [1],
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        message: 'The config "forbidden_resource_types" must be an array of string',
        custom: {
          forbidden_resource_types: [1],
        },
      },
    ],
  },
  {
    name: 'google_secret_manager_secret_version is forbidden',
    data_file: 'testdata/fail.json',
    param: {
      config: {
        forbidden_resource_types: ['google_secret_manager_secret_version'],
      },
    },
    result: [
      {
        name: 'This resource type is forbidden',
        location: {
          address: 'google_secret_manager_secret_version.secret-version-basic',
          type: 'google_secret_manager_secret_version',
        },
      },
    ],
  },
]
