variable "bucket_prefix" {
  type    = string
  default = "microservice-bucket-"
}

variable "initial_bucket_name" {
  type    = string
  default = "initial-bucket"
}

variable "final_bucket_name" {
  type    = string
  default = "final-bucket"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "deletion_window_in_days" {
  type    = number
  default = 10
}

variable "sse_algorithm" {
  type        = string
  description = "(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  default     = "aws:kms"
}

variable "acl" {
  type    = string
  default = "private"
}

variable "microservice_instance_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "instance_profile_name" {
  type    = string
  default = "microservice_profile"
}

variable "role_name" {
  type    = string
  default = "microservice_role"
}

variable "role_policy_name" {
  type    = string
  default = "microservice_deploy_policy"
}

variable "key_alias" {
  type    = string
  default = "alias/microservice-s3-key"
}