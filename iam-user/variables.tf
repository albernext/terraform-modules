variable "user_name" {
  description = "Name for the user"
  type        = string
}

variable "attach_policy" {
  description = "Attach custom policy specified in the policy input to the user"
  type        = bool
  default     = false
}

variable "policy" {
  description = "IAM policy to be attached to the user"
  type        = string
  default     = null
}

variable "aws_managed_policies" {
  description = "List of the names of AWS managed policies to be attached to the user"
  type        = set(string)
  default     = []
}

variable "create_access_key" {
  description = "Create an access key for the user"
  type        = bool
  default     = false
}
