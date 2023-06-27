terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "path_to_your_kubeconfig_file" # Utilisez le fichier kubeconfig obtenu lors de la création du cluster
  }
}

provider "scaleway" {
  zone            = "fr-par-1"
  region          = "fr-par"
  access_key      = var.scw_access_key
  secret_key      = var.scw_secret_key
}

provider "kubernetes" {
  host                   = scaleway_k8s_cluster.rust_webapp_cluster.kubeconfig[0].host
  cluster_ca_certificate = scaleway_k8s_cluster.rust_webapp_cluster.kubeconfig[0].cluster_ca_certificate
  token                  = scaleway_k8s_cluster.rust_webapp_cluster.kubeconfig[0].token
}
