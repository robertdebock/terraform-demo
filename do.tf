variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "example" {
  name       = "example"
  public_key = file("id_rsa.pub")
}

resource "digitalocean_droplet" "web-1" {
  image  = "fedora-32-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.example.fingerprint]
}

resource "digitalocean_droplet" "web-2" {
  image  = "fedora-32-x64"
  name   = "web-2"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.example.fingerprint]
}

resource "digitalocean_loadbalancer" "web" {
  name   = "web"
  region = "ams3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80 
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "tcp"

    target_port     = 443
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.web-1.id, digitalocean_droplet.web-2.id,]
}
