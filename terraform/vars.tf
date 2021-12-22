variable "region" {
  description = "Please enter region for deployment supported by google cloud"
  default     = "us-central1"
}

variable "project" {
  description = "Please enter gcp project id for deployment"
  default     = "project_id"
}

variable "cluster_name" {
  default = "flask-app"
}
