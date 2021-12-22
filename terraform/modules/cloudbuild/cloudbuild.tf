resource "google_cloudbuild_trigger" "flask-trigger" {
  project = var.cb_project

  trigger_template {
    branch_name = "master"
    repo_name   = "gke-flask"
    dir         = "flask"
  }

  substitutions = {
    _PROJECT_ID : var.cb_project
    _CLUSTER_NAME : var.cb_cluster_name
    _COMPUTE_REGION : var.cb_region
  }

  included_files = ["flask/**"]
  filename       = "flask/cloudbuild.yaml"
}


