# Forbid google provider custom endpoints

This lint rule forbids Google provider's custom endpoints.

https://registry.terraform.io/providers/wiardvanrij/ipv4google/latest/docs/guides/provider_reference

e.g.

```tf
provider "google" {
  # ... potentially other provider configuration ...
  storage_custom_endpoint = "http://localhost:4000/"
}
```

## Why?

Attackers can abuse Google provider's custom endpoints to take secrets away.

https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/
