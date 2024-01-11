function(param)
  std.sort([
    {
      message: 'Disallow output declarations without description',
      links: [
        'https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_outputs.md',
      ],
      location: {
        output_name: y.key,
      },
    }
    // {
    //  output: {
    //    name: [
    //      {
    //        description: '',
    //      }
    //    ]
    //  }
    // }
    for x in std.objectKeysValues(param.data.value)
    if x.key == 'output'
    for y in std.objectKeysValues(x.value)
    for z in y.value
    if std.get(z, 'description', '') == ''
  ], function(elem) elem.location.output_name)
