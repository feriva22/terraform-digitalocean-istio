
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# Configure the DigitalOcean Provider
variable "do_token" {}

provider "digitalocean" {
  token   = var.do_token # This is the DO API token.
  # Alternatively, this can also be specified using environment variables ordered by precedence:
  #   DIGITALOCEAN_TOKEN, 
  #   DIGITALOCEAN_ACCESS_TOKEN
}