# Paradigm SLZ

## Getting Started

The repo consists of the follwing folders:
- '.github' - It contains the files which are required for the cicd execution created via github actions.
- '0-bootstrap' - It consists of the terraform configuration required to setup the bootstrap seed project, bucket to store the terraform state and the service-account used to run the cicd workflow to create the resources in gcp.
- '1-oidc' - Contains the terraform configuration required to setup the workload identity federation with the github repo.
- '2-org-policies' - Contains the terraform configuration required to setup the gcp organization policies.
- '3-secure-landing-zone' - Contains the terraform configuration required to setup the folders, projects and network.
- '4-groups' - Contains the terraform configuration required to setup the gcp groups.
- '5-iam' - Contains the terraform configuration required to setup the identity access management.

### Execution Steps:
#### Pre_Requisites

- Following steps needs to be done only once during the initial setup.
- Navigate to the 'infra/0-bootstrap path to run the below commands.
1. Update the tfvars file ('infra/0-bootstrap/bootstrap/bootstrap.tfvars').
2. Comment the backend.tf ('infra/0-bootstrap/backend.tf').
3. run 
   1. $ 'gcloud auth application-default login'
   2. Follow the instructions displayed, ( copy the link generated and use the link to login to your GCP account )
   3. Now copy the string present in that page and paste it in your cli. 
4. Once logged in, run 'terraform init'
5. Then run 'terraform plan -var-file="bootstrap/bootstrap.tfvars"'
6. Once the Plan is success then run 'terraform apply -var-file="bootstrap/bootstrap.tfvars"'
7. Now check for the state bucket that gets created. 
8. uncomment the backend.tf and update the bucket and prefix section with the state bucket metadata.
9. Re-run the 'terraform init'(this should ask to migrate the terraform state).

- Navigate to the 'infra/1-oidc path to run the below commands.
1. Update the tfvars file ('infra/1-oidc/oidc/oidc.tfvars').
2. Comment the versions.tf ('infra/1-oidc/backend.tf').
3. run 
   1. $ 'gcloud auth application-default login'
   2. Follow the instructions displayed, ( copy the link generated and use the link to login to your GCP account )
   3. Now copy the string present in that page and paste it in your cli. 
4. Once logged in, run 'terraform init'
5. Then run 'terraform plan -var-file="oidc/oidc.tfvars"'
6. Once the Plan is success then run 'terraform apply -var-file="oidc/oidc.tfvars"'
7. Now check for the state bucket that gets created. 
8. uncomment the backend.tf and update the bucket and prefix section with the state bucket metadata.
9. Re-run the 'terraform init'(this should ask to migrate the terraform state).
10. Note down the id's of the workloadIdentityPools, providers which gets created as a part of the oidc folder execution. These are used while setting up the cicd via githib actions.

#### Github Actions for cicd
- The '.github' folder contains the yml files for the cicd setup done through github actions. 
- The cicd trigger is currently setup for all the folders. If any new configuration/changes needs to be deployed via trigger, then the additions/changes needs to be done accordingly in the files of '.github' folder and the respective folders.
- The infra trigger is setup in such a way that if any changes are made in respective folders in infra folder and pushed to the 'development' branch then it executes 'terraform plan' and once the plan looks good then it can be merged to 'main' branch so that the 'terraform apply' takes place and the respective gcp resource gets created.
-On a whole if any changes are merged to the 'main' branch for the changes made in any of the folders then the corresponding deployment takes place accordingly.