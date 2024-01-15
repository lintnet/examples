function(param)
  std.set([
    {
      name: e.name,
      lint_file: e.lint_file,
      [if std.objectHas(e, 'description') then 'description']: e.description,
      errors: [
        {
          [if std.objectHas(e2, 'message') then 'message']: e2.message,
          [if std.objectHas(e2, 'level') then 'level']: e2.level,
          [if std.objectHas(e2, 'location') then 'location']: e2.location,
          [if std.objectHas(e2, 'custom') then 'custom']: e2.custom,
          data_file: e.data_file,
        }
        for e2 in param.errors
        if e2.name == e.name
      ],
    }
    for e in param.errors
  ], function(e) e.name)
