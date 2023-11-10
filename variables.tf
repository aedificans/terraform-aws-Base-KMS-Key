#==================#
# Naming & Tagging #
#==================#

variable "environment" {
  description = "A naming object for the environment to provide both the environment's name and abbrevation for tagging and reporting purposes"
  type = object({
    name         = string
    abbreviation = string
  })
  default = null

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.environment.name)) || var.environment == null
    error_message = "The environment name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-]*$", var.environment.abbreviation)) || var.environment == null
    error_message = "The environment abbreviation must be kebab case"
  }
}
variable "naming" {
  description = "A naming object to provide the display name of the service from the service catalog, and optionally also a resource name"
  type = object({
    display  = string
    resource = optional(string, null)
  })

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.naming.display))
    error_message = "The service display name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-]*$", var.naming.resource)) || var.naming.resource == null
    error_message = "If provided, the service resource name must be kebab case"
  }
}
variable "tagging" {
  description = "A collection of tags as key-value pairs to be applied to all applicable provisioned resources"
  type = object({
    additional_tags = optional(map(any), {})
    network         = optional(string, null)
    organization    = string
    owner           = string
    service_name    = optional(string, null)
    service_pattern = string
    tag_key_prefix  = string
  })
}

#==================#
# Resource Configs #
#==================#

variable "description" {
  type        = string
  description = "A brief description of what the KMS Key to be provisioned"
}
variable "policy" {
  type        = string
  default     = null
  description = "A resource policy to be applied to the KMS Key"
}
variable "enable_key_rotation" {
  type        = string
  default     = true
  description = "Specifies whether key rotation is enabled"
}
variable "deletion_window_in_days" {
  type        = number
  default     = 7
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key"
}
variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled"
}
variable "multi_region" {
  type        = bool
  default     = false
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key"
}
