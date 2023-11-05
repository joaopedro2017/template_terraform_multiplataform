variable "server_name" {
  type = string
}

variable "mssql_databases" {
  type = list(string)
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_login" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "dbversion" {
  type = string
}

variable "collation" {
  type = string
}

variable "max_size_gb" {
  type =  number
}

variable "sku_name" {
  type = string
}
