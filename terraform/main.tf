####################
## Module For IAM ##
####################
module "iam" {

  source      = "./modules/iam"
  iam_project = var.project
}


####################
## Module For VPC ##
####################
module "vpc" {

  source      = "./modules/vpc"
  vpc_project = var.project
  vpc_region  = var.region
}


####################
## Module For GKE ##
####################
module "gke" {

  source           = "./modules/gke"
  gke_project      = var.project
  gke_region       = var.region
  gke_sa           = module.iam.sa_id
  gke_vpc          = module.vpc.vpc_id
  gke_subnet       = module.vpc.subnet_id
  gke_cluster_name = var.cluster_name
}

module "cloud_build" {
  source          = "./modules/cloudbuild"
  cb_project      = var.project
  cb_region       = var.region
  cb_cluster_name = var.cluster_name
}
