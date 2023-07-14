variable "name" {
  description = "Name of the secret"
  type        = string
}

variable "description" {
  description = "Description of the secret"
  type        = string
}

variable "policy" {
  description = "Policy to be attached to the secret"
  type        = string
  default     = "{}"
}
