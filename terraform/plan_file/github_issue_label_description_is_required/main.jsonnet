function(param)
  std.sort([
    {
      name: 'github_issue_label description is required',
      location: {
        repository: resource.values.repository,
        label_name: resource.values.name,
      },
    }
    for module in [param.data.value.planned_values.root_module] + std.get(param.data.value.planned_values, 'child_modules', [])
    for resource in module.resources
    if resource.type == 'github_issue_label' &&
    std.member([null, ''], std.get(resource.values, 'description', ''))
  ], function(elem) '%s/%s' % [elem.location.repository, elem.location.label_name])
