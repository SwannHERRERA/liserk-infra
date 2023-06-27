resource "scaleway_k8s_cluster" "rust_webapp_cluster" {
  project_id = var.scw_project_id
  name    = "rust-webapp-cluster"
  version = "1.23.17"
  cni     = "cilium"

  tags = ["rust-webapp"]
}

resource "scaleway_k8s_pool" "default_pool" {
  cluster_id = scaleway_k8s_cluster.rust_webapp_cluster.id
  node_type  = "DEV1_S"
  size       = 3
  region     = "fr-par"
  autohealing = true
  autoscaling = false
  name        = "default" # this is needed, add a name for your pool
}

output "kubeconfig" {
  value     = scaleway_k8s_cluster.rust_webapp_cluster.kubeconfig[0].config_file
  sensitive = true
}
