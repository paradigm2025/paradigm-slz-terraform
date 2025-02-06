module "project-iam-members" {
  source  = "../modules/iam"

  for_each   = var.iam_members
  project_id = each.value.project_id
  role       = each.value.role
  member     = each.value.member
}