data "google_organization" "org" {
  organization = var.org_id
}

module "group" {
  source   = "terraform-google-modules/group/google"
  version  = "~> 0.6"
 
  for_each             = var.groups
  id                   = each.value.id
  display_name         = each.value.display_name
  description          = each.value.description
  customer_id          = data.google_organization.org.directory_customer_id
  members              = each.value.members
}

module "organization-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.1"
  depends_on    = [module.group]
  for_each      = var.organization_iam_bindings
  organizations = each.value.organizations
  mode          = "additive"
  bindings      = each.value.bindings
}