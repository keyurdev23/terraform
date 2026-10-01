variable "ec2_default_storage_size" {
  type        = number
  description = "default storage size"
  default     = 20
}

variable "env" {
  type        = string
  description = "The environment for the infrastructure (e.g., prod, dev)"
  default     = "dev"
}
