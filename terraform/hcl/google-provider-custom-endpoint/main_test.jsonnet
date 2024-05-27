// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.tf',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.tf',
    result: [
      {
        name: "google provider's custom endpoint is forbidden",
        links: [
          'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
        ],
        location: {},
        custom: {
          storage_custom_endpoint: 'http://localhost:4000/',
        },
      },
      {
        name: "google provider's custom endpoint is forbidden",
        links: [
          'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
        ],
        location: {
          alias: 'us-west-2',
        },
        custom: {
          storage_custom_endpoint: 'http://localhost:5000/',
        },
      },
    ],
  },
]
