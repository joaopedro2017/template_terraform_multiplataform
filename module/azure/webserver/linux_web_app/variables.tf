variable "web_app_names" {
  type = list(string)
}

variable "plan_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "worker_count" {
  type = number
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
