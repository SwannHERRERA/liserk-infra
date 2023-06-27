resource "kubernetes_deployment" "rust_app_5545" {
  metadata {
    name = "rust-app-5545-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "rust-app-5545"
      }
    }

    template {
      metadata {
        labels = {
          app = "rust-app-5545"
        }
      }

      spec {
        container {
          image = "rg.fr-par.scw.cloud/stuga/server:latest"
          name  = "rust-app"

          port {
            container_port = 5545
          }
        }
      }
    }
  }
}
