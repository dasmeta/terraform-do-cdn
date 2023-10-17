variable "name" {
  description = "DigitalOcean Space Name"
  type        = string
}

variable "environment" {
  description = "Whatever environment CDN setup is deployed for."
  type        = string
  default     = ""
}

variable "region" {
  description = "The region Space should be located in."
  type        = string
  default     = "fra1"
}

variable "domain" {
  description = "Whatever domain this will be hosted under."
  type        = string
}

variable "k8s" {
  type        = string
  description = "k8s (doks) cluster name to inject service."
}
