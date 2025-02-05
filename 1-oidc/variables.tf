variable "project_id" {
  type        = string
  description = "The project id to create Workload Identity Pool."
}

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID."
}

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider id."
}

variable "issuer_uri" {
  type        = string
  description = "Workload Identity Pool Issuer URL."
}

variable "sa_account_id" {
  type        = string
  description = "The service account id to be used by wif."
}

variable "sa_account_name" {
  type        = string
  description = "The service account name to be used by wif."
}

variable "attribute" {
  type        = string
  description = "The attribute for the oidc."
} 

variable "attribute_condition" {
  type        = string
  description = "The attribute condition for the oidc."
} 