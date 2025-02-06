variable "iam_members" {
  description = "The iam members."
  type        = map(object({
    project_id = string
    role       = string
    member     = string
  }))
}    