variable "sns_topic_name" {
  type        = string
  description = "The name of the SNS topic to send root login notifications."
}

variable "send_sns" {
  type        = bool
  default     = false
  description = "If true will send message *Successful AWS console login with the root account* to SNS topic."
}

variable "alarm_suffix" {
  type        = string
  default     = ""
  description = "Suffix to add to alarm name, used for separating different AWS account."
}

variable "alarm_period" {
  type        = number
  default     = 3600
  description = "The period in seconds over which the specified statistic is applied, eg 3600 sec = 60 mins."
}

variable "alarm_evaluation_periods" {
  type        = number
  default     = 1
  description = "The number of periods over which data is compared to the specified threshold."
}
