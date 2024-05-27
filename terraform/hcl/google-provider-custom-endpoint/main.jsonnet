function(param)
  [
    {
      name: "google provider's custom endpoint is forbidden",
      links: [
        'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
      ],
      /*
      "provider": {
        "google": [
          {
            "storage_custom_endpoint": "http://localhost:4000/"
          }
        ]
      }
      */
      location: {
        [if std.objectHas(googleP, 'alias') then 'alias']: googleP.alias,
      },
      custom: {
        [field.key]: field.value
        for field in std.objectKeysValues(googleP)
        if std.endsWith(field.key, '_custom_endpoint')
      },
    }
    for googleP in std.get(std.get(param.data.value, 'provider', {}), 'google', [])
    if std.any(std.map(function(key) std.endsWith(key, '_custom_endpoint'), std.objectFields(googleP)))
  ]
