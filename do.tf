terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.16.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

resource "digitalocean_ssh_key" "default" {
  name       = "Terraform demo"
  public_key = file("/Users/robertdb/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "default" {
  image  = "fedora-35-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}
