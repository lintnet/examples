function(param)
  std.map(function(e) e {
    [if std.objectHas(e, 'location') then 'location']: std.toString(e.location),
    [if std.objectHas(e, 'custom') then 'custom']: std.toString(e.custom),
  }, param.errors)
