resource kubernetes_deployment nfs {
  metadata {
    name      = local.name
    namespace = local.namespace
  }

  spec {

    selector {
      match_labels = {
        "app.kubernetes.io/role"     = "nfs-server"
        "app.kubernetes.io/instance" = var.instance
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/role"     = "nfs-server"
          "app.kubernetes.io/instance" = var.instance
        }
      }
      spec {
        container {
          name  = "nfs-server"
          image = "gcr.io/google_containers/volume-nfs:0.8"

          port {
            name           = "nfs"
            container_port = 2049
          }

          port {
            name           = "mountd"
            container_port = 20048
          }

          port {
            name           = "rpcbind"
            container_port = 111
          }

          security_context {
            privileged = true
          }

          volume_mount {
            mount_path = "/exports"
            name       = "nfs-pvc"
          }

          volume_mount {
            mount_path = "/etc/exports"
            name = "exports"
            sub_path = "exports"
          }
        }

        volume {
          name = "exports"

          config_map {
            name = kubernetes_config_map.exports.metadata.0.name
          }
        }

        volume {
          name = "nfs-pvc"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.nfs.metadata.0.name
          }
        }
      }

    }
  }
}
