terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "fastapi_image" {
  name = "fastapi-app"
  build {
    context    = "../app"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "fastapi_container" {
  name  = var.container_name
  image = docker_image.fastapi_image.name

  ports {
    internal = var.container_port
    external = var.host_port
  }
}

