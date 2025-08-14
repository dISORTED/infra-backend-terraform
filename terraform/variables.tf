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
  default     = 8080
}
variable "postgres_container_name" {
  description = "Nombre del contenedor de PostgreSQL"
  type        = string
  default     = "postgres-db"
}

variable "postgres_user" {
  type    = string
  default = "admin"
}

variable "postgres_password" {
  type    = string
  default = "admin123"
}

variable "postgres_db" {
  type    = string
  default = "app_db"
}

