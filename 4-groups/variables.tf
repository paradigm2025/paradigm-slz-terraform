variable "groups" {
  type        = any
  description = "Groups names"
}

variable "org_id" {
  description = "The resource name of the parent Organization. Must be of the form organizations/org_id."
  type        = string
}

variable "organization_iam_bindings" {
  type = map(object({
    organizations = list(string)
    bindings      = map(list(string))
  }))
  default = {}
}