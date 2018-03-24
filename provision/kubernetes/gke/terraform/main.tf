locals {
  credentials = <<EOC
  
EOC
}

provider "google" {
  credentials = "${local.credentials}"
}

resource "google_container_cluster" {
  name = "${var.cluster_name}"
  zone = "${var.zone}"
  initial_node_count = 5

  master_auth {
    username = "${var.master_auth_username}"
    password = "${var.master_auth_password}"
  }

  labels = {
    desc = "Vault on k8s"
  }

  tags = ["vault"]
}

output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
