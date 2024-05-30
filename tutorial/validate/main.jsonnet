// A lint file of lintnet.
// https://lintnet.github.io/
local validateJSONSchema = std.native('jsonschema.Validate');

function(param)
  local vr = validateJSONSchema('main_config_schema.json', param.config);
  if vr != null then [
    {
      name: 'description is required',
      message: 'config is invalid',
      custom: {
        errors: vr,
      },
    },
  ] else
    if std.objectHas(param.data.value, 'description') then [] else [{
      name: 'description is required',
    }]
