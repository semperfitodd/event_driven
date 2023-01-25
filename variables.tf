variable "environment" {
  description = "Naming environment variable"

  default = "event_driven"
}

variable "region" {
  description = "AWS Region where resources will be deployed"
  type        = string

  default = "us-east-2"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)

  default = {}
}