provider "google" {
  storage_custom_endpoint = "http://localhost:4000/"
}

provider "google" {
  alias                   = "us-west-2"
  storage_custom_endpoint = "http://localhost:5000/"
}
