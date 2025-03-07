variable "name" {
  type        = string
  description = "Name of the outpost"
}

variable "protocol_providers" {
  type        = list(number)
  description = "List of providers to apply to this outpost"
}

variable "config" {
  type        = string
  default     = null
  description = "Custom configuration definition for the outpost"
}

variable "service_connection" {
  type        = string
  default     = null
  description = "The integration used to manage the outpost"
}

variable "type" {
  type        = string
  default     = "proxy"
  description = "The type of provider used by the application"

  validation {
    condition     = contains(["proxy", "ldap", "radius", "rac"], var.type)
    error_message = "Valid values are proxy, ldap, radius, rac"
  }
}
