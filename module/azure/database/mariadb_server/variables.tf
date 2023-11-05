variable "server_name" {
  type = string
}

variable "mariadb_databases" {
  type = list(string)
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
  type = number
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

variable "charset" {
  type = string
}

variable "collation" {
  type = string
}
