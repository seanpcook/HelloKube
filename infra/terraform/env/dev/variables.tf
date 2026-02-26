variable "name" {
  type    = string
  default = "hellokube-dev"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "node_vm_size" {
  type    = string
  default = "Standard_B2s"
}