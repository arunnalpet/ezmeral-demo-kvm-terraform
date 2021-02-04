# This type is deprecated. Declare the new way.
#variable "myvms" {
#  type = "list"
#  default = [ ]
#}

variable "myvms" {
  type = map(object({
    hostname    = string
    osdisk_gb   = number
    ephdisk_gb  = number
    persdisk_gb = number
    CPU_Count   = number
    RAM         = number
    Image       = string
    nwip        = string
  }))
  description = ""
}

variable "nwgw" {
  type = string
}

variable "nwdns1" {
  type = string
}

variable "nwdns2" {
  type = string
}

variable "nwdnsdom" {
  type = string
}

variable "nwhostdom"{
  type = string
}
