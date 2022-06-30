variable "name" {
  description = "Name of Application Insights resource."
  default = "test"
}
variable "location" {
  description = "Location of Application Insights resource."
  default = "eastus"
}
variable "rg_name" {
  description = "Name of containing Resource Group."
  default = "test"
}
variable "web_tests" {
  description = "A map of web tests (name and URL) to include with resource."
  default     = {}
}
variable "action_group_id" {
  description = "The ID of the action group to activate for alerts."
  default     = ""
}

variable "email_receiver_list" {
  description = "email receiver list"
  type        = map(object({
    name = string
    email_address = string
    use_common_alert_schema = bool
  }))
  default = {
     "key1" = {
      email_address = "test3@gmail.com"
      name = "test"
      use_common_alert_schema = false
    }
     "key2" = {
      email_address = "dwijeshm3@gmail.com"
      name = "dwijesh"
      use_common_alert_schema = false
     }
      "key3" = {
      email_address = "dwij@gmail.com"
      name = "dwij"
      use_common_alert_schema = false
     }
  } 
}