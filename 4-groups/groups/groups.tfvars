org_id = "organizations/417981694507"

groups = {
          iam-admin-group = {
                             id                         = "paradigm-gcp-iam-admins@paradigmasset.com"
                             display_name               = "IAM Admin Group"
                             description                = "The iam admin group"
                             members                    = []
          }
          org-viewer-group = {
                                 id                     = "paradigm-org-viewer@paradigmasset.com"
                                 display_name           = "Org Viewer Group"
                                 description            = "The org viewer group"
                                 members                = []
          }
          project-viewer-group = {
                                 id                     = "paradigm-gcp-project-viewer@paradigmasset.com"
                                 display_name           = "Project Viewer Group"
                                 description            = "The project viewer group"
                                 members                = []
          }
          folder-admin-group = {
                                 id                     = "paradigm-gcp-folder-admins@paradigmasset.com"
                                 display_name           = "Folder Admin Group"
                                 description            = "The folder admin group"
                                 members                = []
          }
          project-owner-group = {
                                 id                     = "paradigm-gcp-project-owner@paradigmasset.com"
                                 display_name           = "Project Owner Group"
                                 description            = "The project owner group"
                                 members                = []
          }
}

organization_iam_bindings = {
  org = {
    organizations = ["417981694507"]
    bindings = {
      "roles/resourcemanager.folderAdmin" = [
        "group:paradigm-gcp-folder-admins@paradigmasset.com"
      ]
      "roles/resourcemanager.organizationViewer" = [
        "group:paradigm-org-viewer@paradigmasset.com",
      ]
      "roles/viewer" =[
       "group:paradigm-gcp-project-viewer@paradigmasset.com", 
      ]
      "roles/resourcemanager.projectIamAdmin" = [
        "group:paradigm-gcp-iam-admins@paradigmasset.com",
      ]
      "roles/owner" = [
       "group:paradigm-gcp-project-owner@paradigmasset.com"
      ]
    }
  }
}