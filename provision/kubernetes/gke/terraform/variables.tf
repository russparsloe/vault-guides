variable "cluster_name" {
  description = "name of the GKE cluster"
  value = "vault-on-k8s"
}

variable "zone" {
  description = "zone for placement"
  value = "us-west1-a"
}

variable "master_auth_username" {
  description = "master auth username for k8s"
}

variable "master_auth_password" {
  description = "master auth password for k8s"
}
