resource kubernetes_persistent_volume_claim nfs {
  metadata {
    name = local.name
    namespace = local.namespace
  }
  spec {
    storage_class_name = kubernetes_storage_class.nfs.metadata.0.name
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.server_storage_size
      }
    }
  }
}
