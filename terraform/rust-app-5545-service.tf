resource "kubernetes_service" "rust_app_5545" {
  metadata {
    name = "rust-app-5545-service"
  }

  spec {
    selector = {
      app = "rust-app-5545"
    }

    port {
      port        = 5545
      target_port = 5545
    }

    type = "LoadBalancer"
  }
}
