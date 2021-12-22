####################
## Project Number ##
####################
data "google_project" "project" {
  project_id = var.iam_project
}

##############################
## Service Account Creation ##
##############################
resource "google_service_account" "service_account" {
  account_id   = "gke-flask"
  display_name = "gke-flask"
}

###################################
## Addind roles to cloudbuild SA ##
###################################
resource "google_project_iam_member" "default_cloudbuild_sa" {
  count = length(var.iam_role)

  project = var.iam_project
  role    = "${element(var.iam_role, count.index)}"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}


###################################
## Addind roles to custom SA ##
###################################
resource "google_project_iam_member" "custom_sa" {
  count = length(var.iam_role)

  project = var.iam_project
  role    = "${element(var.iam_role, count.index)}"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

########################
## Output SA email id ##
########################
output "sa_id" {
  value = google_service_account.service_account.email
}
