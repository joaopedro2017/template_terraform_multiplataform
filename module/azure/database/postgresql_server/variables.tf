variable "server_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "storage_mb" {
  type = string
}

variable "admin_login" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "backup_retention_days" {
  type = number
}

variable "dbversion" {
  type = string
}

variable "postgresql_databases" {
  type = list(string)
}

variable "collation" {
  type = string
}

variable "charset" {
  type = string
}
