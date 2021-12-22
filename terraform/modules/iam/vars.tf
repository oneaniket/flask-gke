variable "iam_project" {
  description = "Please enter gcp project id for deployment"
  default     = "null"
}

variable "iam_role" {
  type    = list(string)
  default = ["roles/storage.admin", "roles/container.admin", "roles/iam.serviceAccountUser", "roles/cloudbuild.builds.editor"]
}
