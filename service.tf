resource kubernetes_service nfs {
  metadata {
    namespace = local.namespace
    name = local.name
  }

  spec {
    port {
      name = "nfs"
      port = 2049
    }

    port {
      name = "mountd"
      port = 20048
    }

    port {
      name = "rpcbind"
      port = 111
    }

    selector {
      "app.kubernetes.io/role" = "nfs-server"
      "app.kubernetes.io/instance" = var.instance
    }

    type = "NodePort"
  }
}
