variable "name" {
  type = string
}
variable "dns" {
  type = string
}
variable "dns_zone" {
  type = string
}
variable "package_file" {
  type    = string
  default = null
}
variable "package_s3_bucket" {
  type    = string
  default = null
}
variable "package_s3_key" {
  type    = string
  default = null
}
variable "runtime" {
  type    = string
  default = "nodejs12.x"
}
variable "timeout" {
  type    = number
  default = 30
}
variable "memory_size" {
  type    = number
  default = 256
}
variable "handler" {
  type    = string
  default = "index.handler"
}
variable "variables" {
  type    = map(string)
  default = {}
}
variable "policy_statements" {
  type = list(
  object({
    actions   = list(string),
    resources = list(string),
    effect    = string
  })
  )
  default = []
}