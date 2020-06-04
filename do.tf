variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web-1" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
}
