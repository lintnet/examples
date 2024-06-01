// A lint file of lintnet.
// https://lintnet.github.io/
local validateJSONSchema = std.native('jsonschema.Validate');
local schema = import 'main_config_schema.json';

function(param)
  // Validate config parameter with JSON Schema.
  local vr = validateJSONSchema(schema, param.config);
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
