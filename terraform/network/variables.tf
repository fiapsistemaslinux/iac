
variable "project" {
  type      = "string"
  default   = "mediawiki"
}

variable "cidr" {
  description = "Network CIDR, Formato: 192.168.XX.0/24"
  type        = "string"
}

variable "turma" {
  type    = "string"
  default = "2TRCR"
}

