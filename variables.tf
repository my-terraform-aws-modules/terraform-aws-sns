variable "region" {
  description = "name of the aws region"
  type = string
  default = "eu-west-1"
}
################################################################################
# Topic
################################################################################

variable "create_topic" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}
variable "environment" {
  description = "The environment to deploy to."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod", "sit", "snd", "uat"], var.environment)
    error_message = "Valid values for var: environment are (dev, prod, sit, snd, uat)."
  }
}
variable "sns_name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = "demosns"
}

variable "use_name_prefix" {
  description = "Determines whether `name` is used as a prefix"
  type        = bool
  default     = false
}
variable "sns_enable_encryption" {
  type        = bool
  description = "Whether or not to use encryption for SNS Topic. If set to `true` and no custom value for KMS key (kms_master_key_id) is provided, it uses the default `alias/aws/sns` KMS key."
  default     = false
}
variable "sns_kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default = ""
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
################################################################################
# Topic Policy
################################################################################

variable "create_topic_policy" {
  description = "Determines whether an SNS topic policy is created"
  type        = bool
  default     = false
}
variable "topic_policy" {
  description = "An externally created fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "source_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "enable_default_topic_policy" {
  description = "Specifies whether to enable the default topic policy. Defaults to `true`"
  type        = bool
  default     = false
}

variable "topic_policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

################################################################################
# Subscription(s)
################################################################################
variable "sns_arn" {
  description = "the arn of the sns topic"
  type = string
  default = ""
}

variable "enable_email_subscribe" {
  description = "whether sns topic subscribed to email or not"
  type = bool
  default = false
  
}
variable "enable_lambda_subscribe" {
  description = "Determine sns topic subscribed to lambda or not"
  type = bool
  default = false
  
}
variable "enable_sqs_subscribe" {
  description = "Determine sns topic subscribed to sqs or not"
  type = bool
  default = false
  
}
variable "email_endpoint" {
  description = "mention the email endpoint"
  type = string
  default = ""
}
variable "lambda_endpoint" {
  description = "give the arn of the lambda"
  type = string
  default = ""
  
}
variable "sqs_endpoint" {
  description = "arn of the sqs"
  type = string
  default = "" 
}
