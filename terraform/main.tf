resource "digitalocean_tag" "UnBonitoTag" {
  name = "UnBonitoTag"
}

resource "digitalocean_droplet" "Trrform" {
  count = 2
  image = "${var.image_id}"
  name  = "AppTerra"
  region = "SFO2"
  size  = "512mb"
  ssh_keys = [25960097]
  user_data = "${file("user-data.web")}"
  tags= ["${digitalocean_tag.UnBonitoTag.id}"]

}

resource "digitalocean_loadbalancer" "ElLoadBalancer"{
  name = "ElLoadBalancer"
  region = "sfo2"

  forwarding_rule {
    entry_port=80
    entry_protocol= "http"

    target_port = 3000
    target_protocol = "http"
  }

  healthcheck {
    port = 3000
    protocol = "http"
    path = "/add/1/1"
  }
  droplet_tag = "${digitalocean_tag.UnBonitoTag.id}"

}
