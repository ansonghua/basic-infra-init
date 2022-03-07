
variable "aws_account_number" {
  type        = string
  description = "AWS Account Number used in Developerment Stage"
}
variable "stage" {
  type        = string
  description = "Stage of Development"
}
variable "env" {
  type        = string
  description = "deployment environment"
}
variable "region" {
  type        = string
  description = "Region of deployment"
}
variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "asap"
}
variable "root_domain" {
  type        = string
  description = "The root domain name of the website."
}
variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}
variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www"
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}
