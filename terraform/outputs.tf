output "fastapi_container_ipv4_address" {
  value = docker_container.fastapi_container.network_data[0].ip_address
}
