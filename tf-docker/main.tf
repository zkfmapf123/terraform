terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = "~> 2.15.0"
      }
    }
}

provider "docker" {
  
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.latest
    name = "container_tutorial"
    ports {
        internal = 8080
        external = 8080
    }
}

