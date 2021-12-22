# flask-gke
#### This is automated deployment of flask application on Google Kubernetes Engine. GKE cluster is created with Terraform along with Cloud Build Trigger. Cloud Build is used for CICD deployments. 

#### Pre-reqs
1. GCP Project with billing enabled
2. GCP Cloud Source Repository for version control
3. Enable APIs of GKE, Cloud Build, Cloud Source Repository, Compute Engine service.
4. Terraform installed on the local machine
5. Cloud Build Setup
6. Service account with permissions to deploy GKE cluster, Create service account, add permissions to service account and create cloud build trigger.

#### Steps for deployment
1. Clone the repository with git clone https://github.com/oneaniket/flask-gke.git
2. cd to flask-gke/terraform
3. Enter your prefered GCP region, GCP Project ID in which to deploy the infra and Cluster name of the GKE cluster.
4. Run terraform init
5. Run terraform plan
6. Run terrafom apply --auto-approve

#### Terraform variables
| Name | Description | Default | Required |
| -----|--------------|-----------|------------------------ |
| Region | Region for GKE Cluster | us-central1 | Yes |
| Project | ID of the project where infra will be deployed | project_id | Yes |
| Cluster Name | Name of the GKE cluster | flask-app | Yes |
