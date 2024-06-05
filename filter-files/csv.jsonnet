local metadata = {
  name: 'age must be greater or equal than 18',
};

function(param)
  std.mapWithIndex(function(idx, line) {
    name: metadata.name,
    excluded: std.parseInt(line[1]) >= 18,
    location: {
      index: idx,
      line: std.join(',', line),
    },
  }, param.data.value)
