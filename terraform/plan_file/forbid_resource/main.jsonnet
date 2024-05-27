// A lint file of lintnet.
// https://lintnet.github.io/
function(param)
  if std.objectHas(param.config, 'forbidden_resource_types') then
    if std.type(param.config.forbidden_resource_types) == 'array' then
      if std.all(std.map(function(a) std.type(a) == 'string', param.config.forbidden_resource_types)) then
        std.sort([
          {
            name: 'This resource type is forbidden',
            location: {
              type: resource.type,
              address: resource.address,
            },
          }
          for module in [param.data.value.planned_values.root_module] + std.get(param.data.value.planned_values, 'child_modules', [])
          for resource in module.resources
          if std.member(param.config.forbidden_resource_types, resource.type)
        ], function(elem) elem.location.address)
      else [
        {
          name: 'The config "forbidden_resource_types" must be an array of string',
          custom: {
            forbidden_resource_types: param.config.forbidden_resource_types,
          },
        },
      ]
    else [
      {
        name: 'The config "forbidden_resource_types" must be an array',
        custom: {
          forbidden_resource_types: param.config.forbidden_resource_types,
        },
      },
    ]
  else [
    {
      name: 'The config "forbidden_resource_types" is required',
    },
  ]
