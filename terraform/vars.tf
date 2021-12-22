variable "region" {
  description = "Please enter region for deployment supported by google cloud"
  default     = "us-central1"
}

variable "project" {
  description = "Please enter gcp project id for deployment"
  default     = "qp-cloud-coe-tfa-1-2021-02"
}

variable "cluster_name" {
  default = "flask-app"
}
