function(param)
  local names = std.set(std.map(
    function(data) data.value.name,
    param.combined_data
  ));

  std.filter(
    function(elem) std.length(elem.location.files) > 1,
    std.map(function(name) {
      name: 'name must be unique',
      location: {
        name: name,
        files: std.filterMap(
          function(data) data.value.name == name,
          function(data) data.file_path,
          param.combined_data
        ),
      },
    }, names)
  )
