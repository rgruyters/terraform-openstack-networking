variable "name" {
  description = "Name of private network"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the network. Default value is a valid CIDR, but can be changed by means"
  type        = string
  default     = "192.168.0.0/24"
}

variable "public_connected" {
  description = "Connect to public network"
  type        = bool
  default     = false
}

variable "public_network_name" {
  description = "Name of the public network"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A list of strings as tags to add to all resources"
  type        = list(string)
  default     = []
}

# vim: ft=tf
