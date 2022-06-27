variable "tags" {
  type        = string
  description = "name of ec2 instance"
}

variable "local_tags" {
  type        = map(any)
  description = "local tags"
}

variable "application_elb_name" {
  type        = string
  description = "name of elb"
}

variable "application_elb_security_groups" {
  type        = list(string)
  description = "security gorups for elb"
}

variable "application_elb_subnets" {
  type        = list(string)
  description = "subent of elb"
}


variable "internal" {
  type        = bool
  description = "true or false. internal"
}

variable "port" {
  type        = number
  description = "port number for target group"
}

variable "target_group_arn" {
  type        = string
  description = "target group arn for listner"
}
