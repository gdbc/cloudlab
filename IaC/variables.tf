# What you need to change is admin_username, admin_password and prefix, for prefix ie: instead of "gra3m3-rancher" use your login
# This way we can identify who is responsible for which VM's

variable "prefix" {
    description = "This is the name of your resource group, make it personal, yet identifiable to others"
    type = string
    default = "gra3m3-rancher"
}

variable "instance_count" {
   type = number
   default = 6
}

variable "location" {
    description = "In which region do you want the VM's to reside"
    type = string
    default = "North Europe"
}

variable "admin_username" {
    type    = string
    default = "changemeuser"
}

variable "admin_password" {
    type    = string
    default = "Chang3m3"
}

variable "resource_group" {
    type    = string
    default = "rancher-training-rg"
}

variable "network_name" {
    type    = string
    default = "rancher-training-network"
}

variable "subnet" {
    type    = string
    default = "internal"
}
