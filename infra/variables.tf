variable "region_main" {
  description = "Region  main for project"
  type        = string
}
variable "admin_email" {
  type        = string
  description = "Email for admin"
}

variable "feedback_table_name" {
  description = "Name for feedback table for project"
  type        = string
}
variable "billing_mode_feedback_table" {
  description = "Billing mode table for project"
  type        = string
}
variable "hash_key_feedback_table" {
  description = "Hash key for feedback table for project"
  type        = string
}

variable "feedback_pdf_s3_name" {
  description = "Feedback s3 bucket name"
  type        = string
}
variable "feedback_ui_app_s3_name" {
  description = "Feedback ui app bucket name"
  type        = string
}
variable "feedback_app_index" {
  description = "Feedback app index"
  type        = string
}

variable "submit_feedback_function_name" {
  description = "Submit feedback function"
  type        = string
}
variable "runtime_function" {
  description = "Runtime for function"
  type        = string
}
variable "role_feedback_function_name" {
  description = "Role for feedback function"
  type        = string
}
variable "submit_feedback_function_handler" {
  description = "Handler for feedback function"
  type        = string
}

variable "feedback_api_name" {
  description = "Name for api rest feedback api"
  type        = string
}
variable "feedback_api_endpoint" {
  description = "Type of endpoint for feedback api"
  type        = list(string)
}
variable "feedback_api_path" {
  description = "Type of endpoint for feedback api"
  type        = string
}
variable "feedback_api_stage" {
  description = "Type of endpoint for feedback api"
  type        = string
}

variable "feedback_cf_origin_access_name" {
  description = "Name of feedback cloud front origin access"
  type        = string
}
variable "feedback_cf_origin_id" {
  description = "Id of origin in feedback cloud front distribution"
  type        = string
}
