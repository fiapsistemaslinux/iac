
variable "template" {
  description = "Template para criar a instancia"
  type        = "string"
  default     = "ubuntu-def"
}

variable "ami" {
  description = "AWS instance ami"
  type        = "string"
  default     = "ami-0d5ae5525eb033d0a"
}

variable "project" {
  type    = "string"
  default = "mediawiki"
}

variable "turma" {
  type    = "string"
  default = "2TRCR"
}

variable "rm" {
  type    = "string"
}

variable "vpc_id" {
  type	    = "string"
  default   = "vpc-0eb3a7c47b809f24b"
}

variable "subnet_id" {
  type	    = "string"
  default   = "subnet-0a564d057cccb5e7b"
}

variable "zone_id" {
  type      = "string"
  default   = "Z35E0MU3IBLUWF"
}

variable "zone_name" {
  type      = "string"
  default   = "fiapdev.com"
}

