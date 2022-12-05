terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = var.ssh_keys

  provisioner "local-exec" {
    command = "ansible-playbook -u root -i ./inventory/hosts.ini --private-key ~/.ssh/id_rsa main.yml"
  }
}

 resource "local_file" "ansible_inventory" {
  content = templatefile("./inventory/inventory.tmpl",
    {
     ip = digitalocean_droplet.web.ipv4_address
    }
  )
  filename = "./inventory/hosts.ini"
}