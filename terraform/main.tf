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

  env = [
    "DB_HOST=postgres-db",
    "DB_PORT=5432",
    "DB_USER=${var.postgres_user}",
    "DB_PASSWORD=${var.postgres_password}",
    "DB_NAME=${var.postgres_db}",
  ]

  ports {
    internal = var.container_port
    external = var.host_port
  }

  depends_on = [docker_container.postgres]
}

resource "docker_container" "postgres" {
  name    = var.postgres_container_name
  image   = "postgres:15"
  restart = "always"

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}",
  ]

  ports {
    internal = 5432
    external = 5432
  }
}


