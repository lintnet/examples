resource "null_resource" "foo" {}

output "foo" {
  value = "foo"
  # description = "foo"
}
