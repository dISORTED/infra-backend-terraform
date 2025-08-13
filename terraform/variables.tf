variable "container_name" {
  description = "Nombre del contenedor"
  type        = string
  default     = "fastapi-terraform"
}

variable "container_port" {
  description = "Puerto interno de la app FastAPI"
  type        = number
  default     = 8000
}

variable "host_port" {
  description = "Puerto externo expuesto en el host"
  type        = number
  default     = 8000
}
