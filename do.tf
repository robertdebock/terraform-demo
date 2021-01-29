variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web-1" {
  image  = "fedora-32-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
}

resource "local_file" "ssh_config" {
  content  = templatefile("./templates/ssh_config.tpl",
  {
    ip       = digitalocean_droplet.web-1.ipv4_address,
    username = "root"
  } )
  filename = "./ssh_config"
}
