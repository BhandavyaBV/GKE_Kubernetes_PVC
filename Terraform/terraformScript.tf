# Define the Google Cloud provider
provider "google" {
  credentials = file("./credentials.json")
  project     = "csci-5409-b00942541"
  region      = "us-central1"  # Set your desired region
}

# Define the Google Kubernetes Engine resource
resource "google_container_cluster" "my-cluster" {
  name     = "kubernetes-cluster"
  location = "us-central1"  # Set your desired location

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"  # Set your desired machine type
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  # Add additional settings as needed
}

# Define output to retrieve the cluster endpoint
output "cluster_endpoint" {
  value = google_container_cluster.my-cluster.endpoint
}